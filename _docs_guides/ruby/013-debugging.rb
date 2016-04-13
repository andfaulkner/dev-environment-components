#!/usr/bin/env ruby

##############################
########## INSPECT ###########
##############################

puts "\n ----- DISPLAYS THE CURRENT DATA CONTENT OF THE OBJECT -----"
puts [1, 2, 3].inspect

#################################
########## EXCEPTIONS ###########
#################################

# exceptions let you package up information about an error into an object
# info about an exception is object of class Exception, or 1 of class Exception's children



puts "------------------------------------------------------------------------------------------"
###########################################
#          GET METHODS OF OBJECT          #
###########################################
puts "***************** GET METHODS OF OBJECT *****************"
puts name_of_object.methods

puts " ----- GET METHODS OF OBJECT, ALPHABETICALLY -----"
puts name_of_object.methods.sort

puts " ----- GET METHODS OF OBJECT, ALPHABETICALLY AND ONE LINE AT A TIME -----"

String.methods.sort.each {|method| puts method}.map{|method| nil}.compact

puts " ----- GET ONLY INSTANCE METHODS OF OBJECT, AND SORT ALPHABETICALLY -----"
String.instance_methods(false).sort



puts "------------------------------------------------------------------------------------------"
#########################
#          pry          #
#########################
# A powerful alternative to irb
# install with 		sudo gem install pry
# run with 				pry

# commands:
# 
# cd any_object_even_a_literal			e.g.			cd "asdf"
# -    puts you in the scope of the object
# 
# cd ..	
# -    go up one level of scope
