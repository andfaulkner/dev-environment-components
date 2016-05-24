Pry.config.editor = "vim"
# history file is in ~/.pry_history

# may as well have them available, ya?
require "rails"
require "active_record"

# needed utils
require 'os'

puts "OS: #{OS}"

## require 'pry-coolline'
if !OS.config["ruby_version"].include?("1.9") && OS.config["RUBY_VERSION_NAME"].include?("ruby-2")
    require 'pry-byebug'
else
#  require 'pry-vterm_aliases'
#    require 'interactive_editor'
#    require 'awesome_print_colors'
    require 'pry-debugger'
end

# if OS.linux? end
# if OS.mac? end

require 'pry-rails'
# require 'pry-macro'
require 'pry-theme'
require 'pry-awesome_print'
require 'pry-stack_explorer'
require 'hirb'
require 'rubygems'
#require 'awesome_print'

require 'shellwords'

Gem.path.each do |gemset|
  $:.concat(Dir.glob("#{gemset}/gems/pry-*/lib"))
end if defined?(Bundler)
$:.uniq!
# require 'pry-editline'

Pry.config.color = true
Pry.config.theme = "solarized"

# Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

# # Include current object scope and time in prompt:
# Pry.config.prompt = proc { |obj, nest_level, _| "[pry@#{obj}] #{Time.now.strftime('%I:%M:%S %p')} > " }


################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ALIASES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
Pry.commands.alias_command 'bt', 'pry-backtrace' rescue nil
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 'step-in', 'step'
Pry.commands.alias_command 'step-over', 'next'
Pry.commands.alias_command 'f', 'finish'
Pry.commands.alias_command 'step-out', 'finish'
Pry.commands.alias_command 'nuke', 'exit-program'
Pry.commands.alias_command 'vim', 'edit'            # because I keep forgetting :(

########## copy-paste ########## 
#Pry.commands.alias_command 'ch', 'copy-history', :desc => 'Copy history to clipboard.'  # <<<<<< WTF WHY ISN'T IT WORKING?!?!?
#Pry.commands.alias_command 'cr', 'copy-result', :desc => 'Copy result to clipboard.'     # <<<<<< WTF WHY ISN'T IT WORKING?!?!?
#Pry.commands.alias_command 'pste', 'paste', :desc => 'Paste from clipboard'              # <<<<<< WTF WHY ISN'T IT WORKING?!?!?

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ COMMANDS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################

# TODO setup NB commands
#Pry::Commands.block_command "" ""

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ TIPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SHELL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
def bash(command)
  escaped_command = Shellwords.escape(command)
  system "bash -c #{escaped_command}"
end
# USAGE: 
# bash("echo $0")  # => bash
# cmd = "cat <(echo 'Saluton!') <(echo 'Kiel vi fartas?')"
# bash(cmd)        # => Saluton! Kiel vi fartas?

def test_def
    puts "TEST WIN!"
end

def own_instance_methods_only(object)
  object.instance_methods - object.class.instance_methods
end

def own_methods_only(object)
  object.methods - Class.methods - Object.methods - BasicObject.methods - Module.methods
end
