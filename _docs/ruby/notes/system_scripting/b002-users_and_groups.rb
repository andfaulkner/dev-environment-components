#!/usr/local/bin/ruby

require 'etc'

puts "------------------------------------------------------------------------------------------"
############################
#          GROUPS          #
############################
puts "***************** GROUPS *****************"

puts "------ Get a list of all groups - in Struct object form (with various attributes) ------"
puts Etc.group {|group| puts group}

puts "------ Get a list of all group names ------"
Etc.group {|group| puts group.name }

puts "------ Get a list of all group names, with members also displayed ------"
Etc.group {|group| puts group.name + ": " + group.mem.join(', ')} 
			# => adm: syslog, andrew
			#    sasl: 
			#    plugdev: andrew
			#    ...[[[many more]]]...

puts "------ Get a list of groups containing members, with members also displayed ------"
Etc.group {|group| 
	if ! group.mem.empty?
		puts group.name + ": " + group.mem.join(', ')
	end
} 
			# => adm: syslog, andrew
			# 	   ...[[[7 others]]]...
			# 	 sambashare: andrew




puts "------------------------------------------------------------------------------------------"
###########################
#          USERS          #
###########################
puts "***************** USERS *****************"

###########################
#          ENV          #
###########################

# puts " ----- GET CURRENTLY LOGGED IN USER -----"
# env = ENV.reduce do |total, var|
# 	total
# end

# puts env.to_s