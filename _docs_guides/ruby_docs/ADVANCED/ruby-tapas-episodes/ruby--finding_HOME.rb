#!/usr/bin/env ruby


puts "------------------------------------------------------------------------------------------"
#######################################################
#          FINDING HOME IF HOME VARIABLE SET          #
#######################################################
puts "***************** FINDING HOME IF HOME VARIABLE SET *****************"

puts Dir.home # => /home/andrew


puts "------------------------------------------------------------------------------------------"
#####################################################
#          FINDING HOME OF A SPECIFIC USER          #
#####################################################
puts "***************** FINDING HOME OF A SPECIFIC USER *****************"

puts Dir.home("andrew") # => /home/andrew 

puts " ----- GET CURRENT USER -----"

require "etc"
puts Etc.getlogin # => andrew

puts " ----- GET CURRENT USER HOME DIR -----"
puts Dir.home(Etc.getlogin) # => /home/andrew