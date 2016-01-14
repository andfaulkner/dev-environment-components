#!/usr/local/bin/ruby
##################################################
#            				EACH LOOPS			             #
##################################################
#
# Takes an array and applies the given block over all the items.
# Doesn't affect or produce a new object - it's just a way of looping items. 
# It returns the original array
#
array_after_each = [1, 2, 3].each do | element |
	element = element * 2
	puts element
end 		
# => 	2			
# 		4			
# 		6

puts array_after_each.to_s # => [1, 2, 3]

##################################################
#            			MAP or COLLECT 		             #
##################################################
#  *** MAP & COLLECT ARE IDENTICAL ***
#
# Takes an array and applies the given block of code over all the items and 
# returns the new array. Does not mutate original array
#
array_before_collect = [1, 2, 3]
array_after_collect = array_before_collect.collect do | element |
	element * 1000 + element
end

puts array_before_collect.to_s # => [1, 2, 3] (does not mutate the original array)
puts array_after_collect.to_s # => [1001, 2002, 3003]

##################################################
#            				TIMES LOOPS		             	 #
##################################################
#
# Run a block of code a given number of times
#

4.times do |i|
	puts "Loop has run #{i} time#{i == 1 ? '' : 's'}"
end


puts "------------------------------------------------------------------------------------------"
############################
#          CYCLES          #
############################
#
# Array.cycle runs enumerator over each item in array 1-by-1, until it reaches the end, then it
# starts over, doing this either infinitiely if nil or no param is given, or the number of times
# you ask it to.
#
puts "***************** CYCLES *****************"
# ["poop back", "and", "poop forth", "and"].cycle { |movement| p movement } 
		# => "poop back" "and" "poop forth" "and" "poop back" "and" "poop forth"     <<< ...forever.
# Note: This stops the rest of the program from running, it just eternally outputs poop messages

puts " ----- ITERATE THRU AN ARRAY 2X; ITERATOR DISPLAYS EACH ITEM IT ITERATES OVER -----"
["om", "nomnom"].cycle(2) { |omanom| puts omanom }
# =>  "om"
# 		"nomnom"
# 		"om"
# 		"nomnom"

puts "------------------------------------------------------------------------------------------"
##################################################
#            		REDUCE or INJECT 		             #
##################################################
#  *** REDUCE & INJECT ARE IDENTICAL ***
#
# Same as reduce in other languages
#

puts "***************** REDUCE OR INJECT *****************"
reduced_array = [1, 2, 3, 4].reduce do |total, n|
	total + n
end

puts " ----- SUM ALL NUMBERS IN AN ARRAY USING A REDUCE / INJECT ----- "
puts reduced_array # => 10


puts "------------------------------------------------------------------------------------------"
#####################################
#          SELECT & REJECT          #
#####################################
puts "***************** SELECT & REJECT: FILTER OUT UNWANTED ARRAY ITEMS *****************"

puts " ----- CREATE TEST ARRAY OF NUMBERS -----"
random_numbers = [1, 2, 4, 6, 8, 9, 11, 12, 13, 15]
puts random_numbers.to_s

puts " ----- FILTER OUT EVEN NUMBERS WITH SELECT (EVEN #s RETURN FALSE) -----"
puts random_numbers.select {|num| num % 2 != 0 }.to_s

puts " ----- FILTER OUT ODD NUMBERS WITH REJECT (ODD #s RETURN TRUE) -----"
puts random_numbers.reject {|num| num % 2 != 0 }.to_s


puts "------------------------------------------------------------------------------------------"
####################################
#          ANY? AND ALL?           #
####################################
puts "***************** ANY? AND ALL?  *****************"

p " ----- ANY?: RETURNS TRUE IF BLOCK RET TRUE FOR ANY ITEM IN ARRAY -----"
p [0, 1, 3, 5, 4].any? {|num| num >= 0 }		# => true
p [0, 1, 3, 5, 4].any? {|num| num >= 5 }		# => true
p [0, 1, 3, 5, 4].any? {|num| num >= 15 }	# => false

p " ----- ALL?: RETURNS TRUE IF BLOCK RET TRUE FOR ALL ITEMS IN ARRAY -----"
p [0, 1, 3, 5, 4].all? {|num| num >= 0 }		# => true
p [0, 1, 3, 5, 4].all? {|num| num >= 5 }		# => false
p [0, 1, 3, 5, 4].all? {|num| num >= 15 }	# => false


puts "------------------------------------------------------------------------------------------"
############################################
#          IMPLEMENTING ITERATORS          #
############################################
#
#  A Ruby iterator is simply a method that can invoke a block of code. In an iterator 
#  method, a block may be invoked as if it's a method itself via the yield statement
#  

puts "***************** IMPLEMENTING ITERATORS *****************"

puts " ----- CREATE A BASIC ITERATOR METHOD -----"
# this runs the block of code it receives 3X: once each time it hits the yield keyword
def three_times
	yield
	yield
	yield
end

puts " ----- RUN A BASIC ITERATOR METHOD -----"
three_times { puts "three_times method ran!" }

# DATA
IDS = [1234, "01212", 5445, "06266", 1599, "01744", 1788]
LETTER_NUM_MAP = {"J"=>1, "O"=>2, "H"=>3, "N"=>4, "A"=>5, "B"=>6, "E"=>7, "S"=>8, "K"=>9 }

puts " ----- CREATE AN ITERATOR WITH A YIELD WITH A RETURN ASSIGNED TO A VARIABLE -----"