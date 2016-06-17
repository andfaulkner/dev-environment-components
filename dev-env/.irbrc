# when you write a line that should have an indent in the next line - such
# as "class Object" - it actually indents the next line
# IRB.conf[:AUTO_INDEX] = true

########## MAKE A VARIETY OF COMMON UNIX COMMANDS WORK IN irb ##########
# def ls
#   %x{ls}.split("\n")
# end

# def cd(dir)
#     Dir.chdir(dir)
#     Dir.pwd
# end

# def pwd
#     Dir.pwd
# end
########################################################################
# def enable_irbtools
#   require 'irbtools'
#   # not using `require 'irbtools/more'` because Bond self-admittedly has errors since
#   #  “EditLine” is also installed, and EditLine is confusing to remove or replace
# rescue LoadError => e
#   # puts e.message # to help debug this rescue clause
#   raise unless e.message.match(/irbtools/)
#   puts "‘irbtools’ not installed - see install notes on https://github.com/janlelis/irbtools"
# end
# enable_irbtools

def enable_gem(gem_name, err_msg=false)
  require gem_name.to_s
  rescue LoadError => e
  raise unless e.message.match(Regexp.new gem_name)
  puts "'#{gem_name}' not installed#{[' ', err_msg].join('').to_s if err_msg}"
end

enable_gem("irbtools", "- see install notes on https://github.com/janlelis/irbtools")
enable_gem("irbtools/more", "- see install notes on https://github.com/janlelis/irbtools")

# def enable_irbtools_more
#   require 'irbtools-more'
#   rescue LoadError => e
#   # puts e.message # to help debug this rescue clause
#   raise unless e.message.match(/irbtools/)
#   puts "‘irbtools’ not installed - see install notes on https://github.com/janlelis/irbtools"
# end

# wirble = cross-session history, colored output, auto-completion
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  $stderr.puts "Couldn't load Wirble: #{err}"
end

require 'irb/completion'
require 'bond'
#require 'bond/completion'
require 'rubygems'

########## PRETTIFY OUTPUT ##########
# pp = prints nested hashes & arrays in a readable, indented format
require 'pp'
require 'awesome_print'
require 'hirb'
#####################################

require 'fileutils'
# require 'irbtools'

########## irb CONFIGURATION ##########
puts "setting irb configuration"
if defined? IRB
  IRB.conf[:AUTO_INDENT] = true
  IRB.conf[:USE_READLINE] = true
  IRB.conf[:LOAD_MODULES] = [] unless IRB.conf.key?(:LOAD_MODULES)
  unless IRB.conf[:LOAD_MODULES].include?('irb/completion')
    IRB.conf[:LOAD_MODULES] << 'irb/completion'
  end
  IRB.conf[:SAVE_HISTORY] = 10000
end
#######################################

############ SHELL METHODS ############
puts "initializing shell methods"
def pwd
    FileUtils.pwd
end
# %x{ls}.split("\n")

def lsa(params="")
  puts "lsa ran"
  dir_list = Dir.new(Dir.pwd)
  if (params.match(/--list/))
    dir_list = dir_list.reduce {|total, item| (total ||= []) << item }
  end
  if (params.match(/(?<!-)-[a-z]*h/))
      dir_list.each {|d| puts "#{d}"}
      hasput = true
  else
      dir_list.reject {|d| d.to_s.start_with?(".") }.each {|d| puts "#{d}"}
      hasput = true
  end
  puts dir_list if (!hasput)
  Dir.pwd
end

def lsa_h
    lsa "-h"
end

def cd(folder)
    Dir.chdir(folder)
    Dir.pwd
end

def mkdir(folder)
    Dir.mkdir(folder)
end

def rmdir(folder)
    Dir.rmdir(folder)
end

def source_for(klass, method_sym)
  location = klass.new.method(method_sym).source_location
  `subl #{location[0]}:#{location[1]}` if location
  location
end
#######################################

puts "setting up reload required files"

#reload required files into the console
def reload(require_regex)
   $".grep(/#{require_regex}/).each {|e| $".delete(e) && require(e) }
end

def view_aliases(output_alias_list=false)
    ap IRB::ExtendCommandBundle.instance_eval("@ALIASES").map{|aliases| "ALIAS : #{aliases[0].to_s.ljust(33)} <-->    #{aliases[1]}"}
    if output_alias_list
        IRB::ExtendCommandBundle.instance_eval("@ALIASES")
    else
        ""
    end
end
