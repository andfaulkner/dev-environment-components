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

module InjectAtMatch

	def self.inject(filename, pattern, new_text, options)
		bk_filename = "#{filename}__bk"

		FileUtils.mv(filename, bk_filename)  # COPY ORIGINAL FILE TO BACKUP
		newfile = []

		File.open(bk_filename, 'r').each_line do |line|
			if options[:before]
			  newfile << ("#{new_text}\n") if line.match pattern
				newfile << line
			else
				newfile << line
			  newfile << ("#{new_text}\n") if line.match pattern
			end
		end.close

		if !options[:no_output]
			puts "OUTPUT\n-------"
			puts newfile
		end

		File.new(filename, "w+").write newfile.join ""
		File.delete bk_filename if options[:wildside]
	end

	def usage
		puts "-----------------------------------------------------------------------------"
		puts "USAGE:        inject_at_match [opts] filename regex text"
		puts "------------------------------------------------"
		puts " injects text into a file before or after all locations matching a given regex"
		puts "------------------------------------------------"
		puts "ARGUMENTS:"
		puts "filename:     path to file to modify"
		puts "regex:        "
		puts "text:         text to inject into file"
		puts "------------------------------------------------"
		puts "OPTIONS:"
		puts "  --before    inject before match"
		puts "  --after     inject after match"
		puts "  --wildside  create no backup"
		puts "  --help      display this help text"
		puts "------------------------------------------------"
		puts 'EXAMPLE:  inject_at_match.rb --before asdf.txt "kittens" "puppies"'
		puts '  Output: '
		puts '             ORIGINAL TEXT   |  NEW TEXT'
		puts '             ----------------+----------------'
		puts '                asdf         |  asdf'
		puts '                kittens      |  puppies'
		puts '                asdf         |  kittens'
		puts '                             |  asdf'
		puts "-----------------------------------------------------------------------------"
	end
end

################################## RUN IF EXECUTING AS CLI TOOL ##################################
if __FILE__ == $0
	# prep CLI args for public InjectAtMatch::inject method
	def __inject__(arguments)
		# note: treats all text after first 2 args as replacement text
		InjectAtMatch::inject arguments.args[0], arguments.args[1], arguments.args.drop(2).join(" "),
													before: arguments.before, wildside: arguments.wildside
	end

	arguments = Arguments.new ARGV
	if arguments.valid_input
		InjectAtMatch::usage                   # SHOW HELP
	else
		__inject__ arguments	      # EXTRACT ARGUMENTS
	end
##################################################################################################

##################### IMPORTED LIBRARY MESSAGE, IF NOT EXECUTING AS CLI TOOL #####################
else
	puts "inject_at_match imported"
end
