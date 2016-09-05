#!/usr/bin/env ruby
# encoding: utf-8

require 'drb/drb'

queue = Queue.new

DRb.start_service('druby://localhost:9999', queue)
DRb.thread.join
