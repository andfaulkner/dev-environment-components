#!/usr/bin/env ruby
require './app/config/logging'
require './app/config/option_handler'

puts "launch server!" if APP_OPTIONS[:run_server] 

require './experiments/define_singleton_methods' if APP_OPTIONS[:singleton_experiment] 
require './experiments/access_private_methods'
require './experiments/overriding_brackets'

puts APP_OPTIONS
puts APP_OPTIONS[:log_level]
puts "here!"

if APP_OPTIONS[:log_level] >= LOG_LEVEL.DEBUG
  puts "Debug mode is on!"
end