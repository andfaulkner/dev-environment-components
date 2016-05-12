#!/usr/bin/env ruby

require 'etc'


puts "------------------------------------------------------------------------------------------"
#################################################
#          ENVIRONMENT VARIABLE ACCESS          #
#################################################
puts "***************** ENVIRONMENT VARIABLE ACCESS *****************"

puts " ----- SEE ALL ENV VARS: KEY IS var[0], VALUE IS var[1] -----"
ENV.each {|var| puts var.to_s } # => ["DB_HOST_SHARD1", "localhost"], ["YF_ENABLED", "false"], ...

puts " ----- SEE ALL ENV VARS IN KEY-VALUE PAIRS -----"
puts ENV.each_pair { |name, value| puts name=>value }

puts " ----- VIEW ENV VAR HASH -----"
puts ENV.inspect

puts " ----- GET NUMBER OF ENV VARS -----"
puts ENV.length

puts " ----- GET COPY OF ENV VARS IN A HASH -----"
# can be modified, filtered, etc without changing the actual environment
puts ENV.to_hash

puts "------------------------------------------------------------------------------------------"
###########################################################
#          VIEW INDIVIDUAL ENVIRONMENT VARIABLES          #
###########################################################
puts "***************** VIEW INDIVIDUAL ENVIRONMENT VARIABLES *****************"

puts " ----- GET HOME FOLDER LOCATION -----"
puts ENV['HOME']	# => /bin/bash

puts " ----- GET TYPE OF SHELL BEING USED - AND LOCATION -----"
puts ENV['SHELL']	# => /bin/bash

puts " ----- GET USERNAME -----"
puts ENV['USERNAME'] # => andrew

puts " ----- GET PATH -----"
puts ENV['PATH']


puts "------------------------------------------------------------------------------------------"
###############################################
#          SET ENVIRONMENT VARIABLES          #
###############################################
puts "***************** SET ENVIRONMENT VARIABLES *****************"
ENV.store('EXAMPLE_ENV_VAR', 'Example value')
puts ENV["EXAMPLE_ENV_VAR"] # => Example value

