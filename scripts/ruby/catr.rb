#!/usr/bin/env ruby

require 'optparse'
require 'colorize'

def get_files
	Dir.glob("**/*").select{ |file|
		File.file?(file)
	}
end

# gets content of all files, places them in a hash. files is an array of filenames
def fname_cat_hash(files)
	files.reduce({}) { |filehash, file_name|
		File.open(file_name) do |myfile|
			lines_array = myfile.reduce([]) { |file_lines, line|
				file_lines.push(line)
				file_lines
			}
			filehash[file_name] = lines_array
			filehash
		end
	}
end

# display formatted form of the file name
def show_fname(fname)
	len = fname.length
	puts "\n#{fname}"
	len.times{||print "*"}
	puts ""
	fname
end

# return matching content, including the line number
def search_content(fname, content, args, exclude_find = /^$/)
	lnum = 0
	output = content.reduce([]) { |text, line|
		lnum = lnum.next
		if args[:find].match(line.scrub) && ! exclude_find.match(line.scrub)
			if ! args[:nocomment] || 
					(args[:nocomment] && args[:find].match(line.scrub).to_s.split('/').length < 2)
				text.push("#{lnum}: #{args[:find].match(line.scrub).to_s.strip}")
				if args[:function]
					text.pop if ! text.last.match(/(?!<[^a-zA-Z0-9_])function(?=[^a-zA-Z0-9_])/)
				end
			end
		end
		text
	}
	show_fname(fname) if not output.empty?
	output
end

# output the file data that matches the find (calls the find)
def prep_find_args(fname, content, args, printer)
	# convert find argument to regular expression if it isn't one already
	args[:orig_find] = args[:orig_find] || args[:find]
	args[:find] = to_full_line_regex(args[:find], args)
	printer.call(search_content(fname, content, args, 
															args[:exclude_find] || /^$/), 
							 args[:orig_find])
end

def to_full_line_regex(str, args)
	if str.class == String && args[:full_line]
		clean_str = str.gsub(/^\^/, "").gsub(/\$$/, "")
		puts clean_str
		str = ".*#{clean_str}.*"
	end
	to_regexp(str)
end

# convert string to regular expression
def to_regexp(str)
	if str.class == String
		Regexp.new(str.gsub(/\/\w?$/, "").gsub("/", ""))
	else
		str
	end
end

# used to actually match arguments of interest
def match_args(arg, opts, keys)
	keys.reduce(opts) {|options, key|
		if arg.match("=") && (arg.include? key.to_s)
			arg_arr = arg.split("=")
			if arg_arr[0] == key.to_s
				options[arg_arr[0].to_sym] = arg_arr[1]
			end
		end
		options
	}
end

#request the arguments of interest
def get_args(argv, arg_list)
	argv.reduce({}) do |opts, arg|
		opts = match_args(arg, opts, arg_list)
		opts
	end
end

# get a single flag argument
def flag_arg(argv, args, addition)
	args[addition.to_sym] = ((argv.include? addition) || (argv.include? "--#{addition}"))
	puts args
	args
end

# get single flag arguments
def flag_args(argv, args, new_args)
	new_args.reduce(args) { |margs, magic_arg|
		flag_arg(argv, margs, magic_arg)
	}
end

args = get_args(ARGV, ["find", "ftype", "exclude", "exclude_find"])
args = flag_args(ARGV, args, ["function", "full_line", "nocomment"])

# special printing function, to allow colorized printing
printer = Proc.new {|data, orig_find|
	orig_matches = data.to_s.match(orig_find)
	if orig_matches
		data.each {|line|
			orig_match = line.match(orig_find)
			output = line.split(orig_match.regexp)
			print output[0]
			print orig_match.to_s.green
			print "#{output[1]}\n"
		}
	end
}

# actually display the filenames and matching content below
fname_cat_hash(get_files).each { |fname, content|
	# if filetype was given, only let matching files through; otherwise let all files through
	if (args[:ftype] && fname.split(".").last.match(args[:ftype])) || (! args[:ftype])
		# Exclude filenames with the exclude
		if (! args[:exclude]) || (args[:exclude] && ! fname.match(args[:exclude])) 
			prep_find_args(fname, content, args, printer)
		end
	end
}