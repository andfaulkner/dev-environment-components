Pry.config.editor = "vim"
# history file is in ~/.pry_history

Pry.config.color = true
Pry.config.theme = "solarized"

Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

require 'rubygems'
require 'interactive_editor'
require 'awesome_print'
#require 'awesome_print_colors'

# may as well have them available, ya?
require "rails"
require "active_record"

Pry.commands.alias_command 'bt', 'pry-backtrace' rescue nil
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 'step-in', 'step'
Pry.commands.alias_command 'step-over', 'next'
Pry.commands.alias_command 'f', 'finish'
Pry.commands.alias_command 'step-out', 'finish'
Pry.commands.alias_command "nuke", "exit-program"
Pry.commands.alias_command "vim", "edit"            # because I keep forgetting :(

