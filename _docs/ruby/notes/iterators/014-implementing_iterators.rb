#!/usr/local/bin/ruby

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


puts "------------------------------------------------------------------------------------------"
# TEST DATA
IDS = [1234, "01212", 5445, "06266", 1599, "01744", 1788]
LETTER_NUM_MAP = {"J"=>1, "O"=>2, "H"=>3, "N"=>4, "A"=>5, "B"=>6, "E"=>7, "S"=>8, "K"=>9 }

# 
# BLOCK PASSING HEAVILY USED BELOW - GOOD FOR REFERENCE
#

puts " ----- CREATE METHOD CONTAINING ITERATOR WITH yield INSIDE (MTD1) -----"
def count_up_adder
	(0..Float::INFINITY).reduce { |total, num|
		total += num
		yield(num, total)
	}
end

# 
# Explicit return statements in blocks will actually cause the method they're passed into to 
# return as well. This is extrmeely useful for interrupting iteration,
# 
# Note that this does not work with procs or lambdas - only blocks. Return statements in procs
# and lambdas cause only the proc or lambda to return, not the method enclosing them.
# 

puts "-DEF METHOD 2 PASS A 'RUNS-@-yield' BLOCK-->MTD1 THAT FORCES RET FROM MTD1 IF A COND IS MET-"
def count_to_max(max_num)
	count_up_adder { |num, total|
		puts "Current iteration: #{num}. Current total: #{total}"
		return total if num >= max_num
		total
	}
end

puts " --- RUN METHOD THAT PASSES BLOCK->MTD1 W ARG FORCING MTD1 2 RET AFTER 15 ITERATOR LOOPS ---"
count_to_max(15)
# => Current iteration: 1. Current total: 1
# 	 Current iteration: 2. Current total: 3
# 	 ...
#    Current iteration: 14. Current total: 105
#    Current iteration: 15. Current total: 120