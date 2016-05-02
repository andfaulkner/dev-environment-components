require 'Pry'
binding.pry
#          =~          #

puts "------------------------------------------------------------------------------------------"
##########################################################
#                          =~                            #
##########################################################
puts "***************** =~  with example item1 =~ item2 *****************"

puts " ----- Returns nothing if Regex1 doesn't match on String1-----"
puts "Meeka Peeka Faulkner" =~ /nepegrn/
# =>                <<< nothing is returned

puts " ----- Returns character match starts on (if there's a match) -----"
puts "Meeka Peeka Faulkner" =~ /Peeka/


puts "------------------------------------------------------------------------------------------"



puts "------------------------------------------------------------------------------------------"
##########################################################
#                          ||=                           #
##########################################################

puts "***************** ||= *****************"

puts " ----- ||= is for assigning a value to a variable & 'memoizing' it -----"

puts " ----- Assign value to my_default_param -----"
my_default_param ||= "hello"
puts my_default_param
# => hello

puts " ----- Assign another value to my_default_param, note it doesn't change -----"
my_default_param ||= "bonjour"
puts my_default_param
# => hello


puts "------------------------------------------------------------------------------------------"
########################
#          **          #
########################
puts "*****************   **   *****************"

puts " ----- ** is for exponentiation e.g. 3**5 is 3 to the power of 5 -----"

puts 3**5




puts "------------------------------------------------------------------------------------------"
#########################
#          <=>          #
#########################
puts "***************** <=> *****************"
puts " ----- 0 if left & right are equal; 1 if left > right; -1 is right > left -----"

puts ["y", "z"] <=> ["e", "b"] 


#   ::      lets you reference a constant using the module name and two colons. More specifically:
# 			a unary operator that allows: constants, instance methods & class methods defined
# 			within a class or module to be accessed from anywhere outside the class or module.
# 

# 		TODO
# 	WHOLE FILE IS A WIP
#   



