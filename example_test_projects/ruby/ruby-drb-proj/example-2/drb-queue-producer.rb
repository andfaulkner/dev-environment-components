#!/usr/bin/env ruby
# encoding: utf-8

require 'drb/drb'

DRb.start_service

# call the queue hosted by drb-queue-server.rb
queue = DRbObject.new_with_uri('druby://localhost:9999')

# add items to the queue
queue.push(42)
queue.push(99)
