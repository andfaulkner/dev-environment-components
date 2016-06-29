#!/usr/bin/env ruby
# encoding: utf-8

require 'drb/drb'

# basic object exposed over a network
class DRbTestApp
  def greet
    'Hello, world!'
  end
end

object = DRbTestApp.new

# starts a local dRuby server on port 9999. object is the obj we want to call from other processes
DRb.start_service('druby://localhost:9999', object)

puts 'dRb server bootup complete'
puts 'DRbTestApp object exposed at druby://localhost:9999'

# prevents program from exiting immediately
DRb.thread.join
