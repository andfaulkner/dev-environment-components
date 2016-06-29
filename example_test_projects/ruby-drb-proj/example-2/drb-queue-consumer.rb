#!/usr/bin/env ruby
# encoding: utf-8

require 'drb/drb'

DRb.start_service
queue = DRbObject.new_with_uri('druby://localhost:9999')

# runs every time there's new data
loop do
  data = queue.pop
  puts "Processing #{data}"
end
