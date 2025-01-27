#!/usr/local/bin/ruby

require 'etc'
require 'rush'

class InstanceMethodTestClass
	def initialize
		puts 'InstanceMethodTestClass'
	end
	def test_method
		puts "test method ran!"
	end
end

imtc = InstanceMethodTestClass.new
p imtc
p InstanceMethodTestClass.instance_methods(false).sort

p Rush.class

# Rush.methods.sort.reject {|mtd| mtd.match(/yaml|^public|^private|^instance|^method|^protected|^class|^singleton|^const/) }.each {|mtd| p mtd }

puts Rush.my_process.pid


# puts "------------------------------------------------------------------------------------------"
# #################################################
# #          ENVIRONMENT VARIABLE ACCESS          #
# #################################################
# puts "***************** ENVIRONMENT VARIABLE ACCESS *****************"

# puts " ----- SEE ALL ENV VARS: KEY IS var[0], VALUE IS var[1] -----"
# ENV.each {|var| puts var.to_s } # => ["DB_HOST_SHARD1", "localhost"], ["YF_ENABLED", "false"], ...

# puts " ----- SEE ALL ENV VARS IN KEY-VALUE PAIRS -----"
# puts ENV.each_pair { |name, value| puts name=>value }

# puts " ----- VIEW ENV VAR HASH -----"
# puts ENV.inspect

# puts " ----- GET NUMBER OF ENV VARS -----"
# puts ENV.length

# puts " ----- GET COPY OF ENV VARS IN A HASH -----"
# # can be modified, filtered, etc without changing the actual environment
# puts ENV.to_hash

# puts "------------------------------------------------------------------------------------------"
# ###########################################################
# #          VIEW INDIVIDUAL ENVIRONMENT VARIABLES          #
# ###########################################################
# puts "***************** VIEW INDIVIDUAL ENVIRONMENT VARIABLES *****************"

# puts " ----- GET HOME FOLDER LOCATION -----"
# puts ENV['HOME']	# => /bin/bash

# puts " ----- GET TYPE OF SHELL BEING USED - AND LOCATION -----"
# puts ENV['SHELL']	# => /bin/bash

# puts " ----- GET USERNAME -----"
# puts ENV['USERNAME'] # => andrew

# puts " ----- GET PATH -----"
# puts ENV['PATH']


# puts "------------------------------------------------------------------------------------------"
# ###############################################
# #          SET ENVIRONMENT VARIABLES          #
# ###############################################
# puts "***************** SET ENVIRONMENT VARIABLES *****************"
# ENV.store('EXAMPLE_ENV_VAR', 'Example value')
# puts ENV["EXAMPLE_ENV_VAR"] # => Example value

