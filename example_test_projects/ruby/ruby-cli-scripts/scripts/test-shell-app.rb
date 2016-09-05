#!/usr/bin/env ruby
# encoding: utf-8

require 'highline'
require './scripts/script-helpers'

cli = HighLine.new

# A shell!
cli.say("\nYou can even build shells...")
loop do
  cli.choose do |menu|
    menu.layout = :menu_only

    menu.shell  = true

    menu.choice(:load, 'Load a file.') do |command, details|
      cli.say command
      cli.say("Loading file with options:  #{details}...")
    end
    menu.choice(:save, 'Save a file.') do |command, details|
      cli.say command
      cli.say("Saving file with options:  #{details}...")
    end
    menu.choice(:quit, 'Exit program.') { exit }
  end
end
