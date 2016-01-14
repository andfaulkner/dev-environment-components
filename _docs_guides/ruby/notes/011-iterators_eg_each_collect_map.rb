#!/usr/bin/ruby
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

##################################################
#            		REDUCE or INJECT 		             #
##################################################
#  *** REDUCE & INJECT ARE IDENTICAL ***
#
# Same as reduce in other languages
#

reduced_array = [1, 2, 3, 4].reduce do |total, n|
	total + n
end

puts reduced_array # => 10