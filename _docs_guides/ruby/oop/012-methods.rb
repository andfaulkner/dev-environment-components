#!/usr/bin/env ruby

##################################################
#            				BASIC METHODS		             #
##################################################
# pretend asdf given as an argument

puts "***************** BASIC METHODS *****************"

puts " ----- DEFINE A BASIC METHOD THAT TAKES 1 PARAMETER -----"
def output_text(text)
	puts text
end

puts " ----- CALL BASIC METHOD THAT TAKES 1 PARAMETER -----"
output_text(ARGV[0]) # => asdf

puts " ----- CALL BASIC METHOD THAT TAKES 1 PARAMETER WITH A CLI ARGUMENT -----"
output_text("something") # => something


puts "------------------------------------------------------------------------------------------"
#############################
#          VARARGS          #
#############################
puts "***************** VARARGS *****************"

puts " ----- DEFINE METHOD THAT CAN TAKE 2 OR MORE PARAMS (VARIABLE NUMBER OF PARAMS) -----"
def sport_scores(sport, *more)
	puts "SPORT: #{sport}; SCORES: #{more}"
end

puts " ----- CALL FUNCTION THAT CAN TAKE 2 OR MORE PARAMS WITH 2 PARAMS -----"
sport_scores("snowboarding", "442s")

puts " ----- CALL FUNCTION THAT CAN TAKE 2 OR MORE PARAMS WITH 3 PARAMS -----"
sport_scores("soccer", 2, 1)

puts " ----- CALL FUNCTION THAT CAN TAKE 2 OR MORE PARAMS WITH 5 PARAMS -----"
sport_scores("tennis", 4, 2, 3, 4)

puts "------------------------------------------------------------------------------------------"


puts "------------------------------------------------------------------------------------------"
###################################################
#          DYNAMIC METHOD CALLS VIA send          #
###################################################
puts "***************** DYNAMIC METHOD CALLS VIA send *****************"
puts [1, 2, 3].send('inspect')
# identical to [1, 2, 3].inspect
# this matters because variables can be passed to send
# send can be used to call private methods
# 	but seriously don't
# 		...except for unit testing


puts "------------------------------------------------------------------------------------------"
############################################################################################
#          OPERATORS - E.G. +, -, *, /, =, ==, !=, <, >, >=, <=, [] - ARE METHODS          #
############################################################################################
puts "***************** OPERATORS (E.G. +, -, *, /, [], <, =, ==) ARE METHODS *****************"

puts " ----- CALL A PLUS SIGN AS A METHOD OF A NUMBER - SAME RESULT AS E.G. 3 + 4 -----"
puts 4.+(3) # => 7	
# Why does this work? Because Ruby makes an exception in its syntactic rules for commonly
# used operators so you don't have to use periods to invoke them on objects.

puts " ----- USING [] AS A METHOD ON AN ARRAY WORKS JUST FINE  -----"
dogs = ['meeka', 'callie', 'jake']
p dogs.[](1) 													# => "callie"



puts "------------------------------------------------------------------------------------------"
#################################################################
#          RETURN METHOD OBJECT (METHODS ARE OBJECTS)           #
#################################################################
puts "***************** RETURN A METHOD OBJECT - (METHODS ARE OBJECTS) *****************"

puts "create a random class"
class Calculator
  def add(a, b)
    return a + b
  end
end



puts "------------------------------------------------------------------------------------------"
#########################################
#          NOTES ON MAGIC DSLs          #
#########################################
# Remember that this:
#     validates :name, presence: true
# ...is the same as this:
# 		validates(:name, presence: true)
# ...which is the same as this
# 		validates(:name, {presence: true})
# makes more sense now, ya?

puts " ----- create function that takes 2 variables & reports their types -----"
def hello_types(param_one, param_two)
	puts "parameter one value: #{param_one};    param one class: #{param_one.class}"
	puts "parameter two value: #{param_two};    param two class: #{param_two.class}"
end

### This output is produced:
# 		=>  parameter one value: name;    param one class: Symbol
# 		=>  parameter two value: {:presence=>true};    param two class: Hash
# ...by all 4 of the following:
hello_types :name, presence: true
hello_types(:name, presence: true)
hello_types(:name, {presence: true})
hello_types :name, {presence: true}

# ...because all 4 are precisely equivalent. Ruby is very, very forgiving.

