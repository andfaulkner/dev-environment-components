#!/usr/local/bin/ruby

##############################
########## INSPECT ###########
##############################

puts "\n ----- DISPLAYS THE CURRENT DATA CONTENT OF THE OBJECT -----"
puts [1, 2, 3].inspect



puts "------------------------------------------------------------------------------------------"
##############################################################################
#          PUT AT FILE BOTTOM OF TO LET FILE ACT AS LIB _OR_ SCRIPT          #
##############################################################################
puts "***************** PUT AT FILE BOTTOM OF TO LET FILE ACT AS LIB _OR_ SCRIPT *****************"

if __FILE__ == $0
	puts "run this code here if this is the main file being run"
	puts "why? because you can use this as a library otherwise"
	puts "...which is where classes actually start to matter"
end

