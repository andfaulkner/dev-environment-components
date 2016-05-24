#!/usr/bin/env ruby
require 'fileutils'

# HANDLE CLI ARGUMENTS
class Arguments
	attr_reader :args

	def initialize(args)
		@args = args 																						# provide args from cli
		%w(wildside before after).each {|var| define_var(var) } # dynamically define vars
		@after = true if !@before && !@after 										# inject after is the default
	end

	def valid_input
		@args.size < 3 || (@before && @after) || (@args[0..2].find_index("--help"))
	end

	def method_missing(method_name, *arguments, &block)
		if method_name.to_s =~ /=$/
  		instance_variable_set("@#{method_name.to_s.chop}", arguments[0])
		end
	end

	private
		def define_var(arg)
			if (does_match = @args[0..3].find_index("--#{arg}"))
				instance_variable_set("@#{arg}", !!@args.slice!(does_match)) # remove inject before arg
			end
			self.class.class_eval("attr_reader :#{arg}") 									 # define new readable var
			# (class << self; self; end).send(:attr_reader, "#{arg}".to_sym) # identical
		end
end

arguments = Arguments.new ARGV

if __FILE__ == $0

	# IF INCORRECT INPUT, SHOW USAGE
	if arguments.valid_input
		puts "-----------------------------------------------------------------------------"
		puts "USAGE:        inject_at_match [opts] filename regex text"
		puts "------------------------"
		puts "ARGUMENTS:"
		puts "filename:     path to file to modify"
		puts "regex:        "
		puts "text:         text to inject into file"
		puts "------------------------"
		puts "OPTIONS:"
		puts "  --before    inject before match"
		puts "  --after     inject after match"
		puts "  --wildside  create no backup"
		puts "  --help      display this help text"
		puts "-----------------------------------------------------------------------------"

	# EXTRACT ARGUMENTS
	else
		filename, pattern = arguments.args[0], %r(#{arguments.args[1]})
		new_text = arguments.args.drop(2).join(" ") # TREAT ALL TEXT AFTER FIRST 2 ARGS AS REPLACEMENT TEXT
		bk_filename = "#{filename}__bk"

		# COPY ORIGINAL FILE TO BACKUP
		FileUtils.mv(filename, bk_filename)
		newfile = []

		File.open(bk_filename, 'r').each_line do |line|
			if arguments.before
			  newfile << ("#{new_text}\n") if line.match(pattern)
				newfile << line
			else
				newfile << line
			  newfile << ("#{new_text}\n") if line.match(pattern)
			end
		end.close

		puts "OUTPUT\n-------"
		puts newfile

		File.new(filename, "w+").write(newfile.join(""))

		if arguments.wildside
			File.delete(bk_filename)
		end

	end
end
