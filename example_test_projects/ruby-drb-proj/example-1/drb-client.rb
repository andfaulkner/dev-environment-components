#!/usr/bin/env ruby
# encoding: utf-8

require 'drb/drb'

DRb.start_service

# create an instance of DRbObject which proxies all method calls to obj served in drb-server.rb
remote_object = DRbObject.new_with_uri('druby://localhost:9999')

# call made to object hosted in drb-server over dRb
puts remote_object.greet
