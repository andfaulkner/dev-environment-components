#!/usr/bin/env ruby
# encoding: utf-8

require 'highline'
require './scripts/script-helpers'

cli = HighLine.new

# select options from a menu
cli.choose do |menu|
  menu.prompt = 'Please choose your favorite bear?  '
  menu.choices(:grizzly, :polar) { cli.say('Badass!') }
  menu.choice(:sun) { cli.say('Aw, that\'s so cute') }
  menu.choices(:brown, :black) { cli.say 'Pretty badass, but not as badass as grizzly or polar' }
end

# select options from a set of characters
choices = 'ynaq'
answer = cli.ask("Your choice [#{choices}]? ") do |q|
  q.echo      = false
  q.character = true
  q.validate  = /\A[#{choices}]\Z/
end
cli.say("Your choice: #{answer}")

# basic request and storage of result in a var
password = cli.ask 'Please provide a password'
cli.say "this is your password: #{password}"

######## validation ########
cli.ask('What is your age?  ', Integer) {|q| q.in = 0..125 }

zip = cli.ask('Zip?  ') do |q|
  q.validate = /\A\d{5}(?:-?\d{4})?\Z/
  q.responses[:not_valid] = 'Zip must be in ###### format, and can only contain digits.'
end
puts "zip provided: #{zip}"

phone = cli.ask('Phone?  ', ->(p) { p.delete('^0-9').sub(/\A(\d{3})/, '(\1) ').sub(/(\d{4})\Z/, '-\1') }) do |q|
  q.validate =              ->(p) { p.delete('^0-9').length == 10 }
  q.responses[:not_valid] = 'Enter a phone number with an area code.'
end
puts "phone number provided: #{phone}"
############################

# instantly grab text as soon as user types in 10 chars or more (without pressing enter)
text = cli.ask('Enter text (max 10 chars): ') {|q| q.limit = 10 }
cli.say text

# colour and style text
cli.say("This should be <%= color('bold', BOLD) %>!")
cli.say("This should be <%= color('underlined', UNDERLINE) %>!")
cli.say("This should be <%= color('black', BLACK) %>!")
cli.say("This should be <%= color('red', RED) %>!")
cli.say("This should be <%= color('green', GREEN) %>!")
cli.say("This should be <%= color('yellow', YELLOW) %>!")
cli.say("This should be <%= color('blue', BLUE) %>!")
cli.say("This should be <%= color('magenta', MAGENTA) %>!")
cli.say("This should be <%= color('cyan', CYAN) %>!")
cli.say("This should be <%= color('white', WHITE) %>!")
cli.say('This might <%= BLINK %>blink<%= CLEAR %>!')

# take unlimited number of inputs, with matches on '' triggering end of data entry
grades = cli.ask('Enter test scores (or a blank line to quit):',
                 lambda {|ans| ans =~ /^-?\d+$/ ? Integer(ans) : ans }) do |q|
  q.gather = ''
end

cli.say 'Grades:'
cli.say grades

# # blank out some text
# prompt = 'here is your password:'
# cli.ask("#{prompt} <%= color(PASSWORD, RED, BOLD) %> (Press key to blank password out)") do |q|
#   q.overwrite = true
#   q.echo      = false  # overwrite works best when echo is false.
#   q.character = true   # if this is set to :getc then overwrite does not work
# end
# cli.say('<%= color(("*" * PASSWORD.length), GREEN) %>')
