#!/usr/bin/env ruby

puts "------------------------------------------------------------------------------------------"
##########################################
#          ARITHMETIC OPERATORS          #
##########################################
puts "***************** ARITHMETIC OPERATORS *****************"

# 	 
# 	 +   -   *   /    <<<are all exactly what you'd expect 
# 	 

puts " ----- MODULO AKA REMAINDER: %  -----"
puts 5 % 2 # => 1

puts " ----- EXPONENT: **  -----"
puts 5**2 # => 25


puts "------------------------------------------------------------------------------------------"
##########################################
#          COMPARISON OPERATORS          #
##########################################
puts "***************** COMPARISON OPERATORS *****************"
#
# STANDARD OPERATORS: 	==	<=	>=	!=
#

puts " ---- COMBINED COMPARISON OPERATOR: <=>  ...WHERE -1 IF L < R; +1 IF R > L; 0 IF L == R ----"
puts 1 <=> 100	# => -1
puts 100 <=> 1	# => +1
puts 50 <=> 50	# => 0

puts " ----- METHOD CALL EQUALITY TEST: .eql?   ...SAME AS == -----"
puts 1.eql?(1)



puts "------------------------------------------------------------------------------------------"
#########################################
#          PARALLEL ASSIGNMENT          #
#########################################
puts "***************** PARALLEL ASSIGNMENT *****************"


puts "------------------------------------------------------------------------------------------"
#################################
#          MATH MODULE          #
#################################
puts "***************** MATH MODULE *****************"

puts " ----- DISPLAY PI up to 17 digits -----"
puts Math::PI				# => 3.141592653589793

puts " ----- INFINITY VALUE -----"
p Float::INFINITY 		# => Infinity 		<<<< interestingly, puts won't output Infinity
p -Float::INFINITY 		# => -Infinity

puts " ----- GET THE SQUARE ROOT -----"
puts Math.sqrt(64)	# => 8.0

puts " ----- GET THE CUBE ROOT -----"
puts Math.cbrt(64)	# => 4.0

#
# Note: geometry, trigonometry, & logarithm-related methods can be found in the Math
# 			module as well, but...YAGNI, most likely (unless you decide to make games :D)
#


puts "------------------------------------------------------------------------------------------"
###########################################
#          NUMBER OBJECT METHODS          #
###########################################
puts "***************** NUMBER OBJECT METHODS *****************"

puts " ----- ABSOLUTE VALUE -----"
puts (-432).abs 		# => 432

puts " ----- IS IT EVEN? -----"
puts 41.even? # => false
puts 42.even? # => true

puts " ----- IS IT ODD? -----"
puts 41.even? # => true
puts 42.even? # => false

puts " ----- IS IT ZERO? -----"
puts 0.zero? # => true
puts (15-15).zero? # => true
puts 43.zero? # => false

puts " ----- IS IT AN INTEGER? -----"
puts (4.21).integer? # => false
puts 0.integer? # => true
puts (-54).integer? # => true
puts (-3.58).integer? # => false

puts " ----- ITERATE UPWARD BY 1 -----"
puts 42.next
	#...OR...
puts 42.succ

puts " ----- ITERATE DOWNWARD BY 1 -----"
puts 42.next
	#...OR...
puts 42.succ

puts " ----- FLOOR -----"
puts (34.9).floor 	# => 34
puts (34.1).floor 	# => 34
puts (34.5).floor 	# => 34

puts " ----- CEILING -----"
puts (34.9).ceil 	# => 35
puts (34.1).ceil 	# => 35
puts (34.5).ceil 	# => 35

puts " ----- ROUND TO ANY NUMBER OF DIGITS -----"
puts (42.58349312).round # => 42					<<<< default is to round to 0 decimal places
puts (42.58349312).round(2) # => 42.58
puts (42.58349312).round(-1) # => 40			<<<< round by negative digits to round by 10s, 100s, etc

