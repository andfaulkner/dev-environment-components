#!/usr/local/bin/ruby


puts "------------------------------------------------------------------------------------------"
######################################
#          GET CURRENT TIME          #
######################################
puts "------ GET CURRENT TIME ------"

puts Time.now # => 2015-12-30 04:56:08 -0500 			<<< the first time this was run
puts Time.now.to_s.replace(" ", "") # => 2015-12-30 04:56:08 -0500 			<<< the first time this was run

