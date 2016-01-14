#!/usr/local/bin/ruby

# Modules allow you to group constants and methods together logically into 
# groups called namespaces, groups which organize modules and the like in 
# such a way as to avoid ambiguity and promote logical organization of code.
# 
# Namespaces: allow you to write larger groups of reusable code without the danger of
# stomping on other code outside of the namespace.
# 

# READABLE_FLAG = "r"
# WRITABLE_FLAG = "w"
# EXECUTABLE_FLAG = "e"

CLASS = "Drinking wine from the bottle level"

puts "------------------------------------------------------------------------------------------"
######################################
#          CREATING MODULES          #
######################################
puts "***************** CREATING MODULES *****************"

puts " ----- CREATE A MODULE CONTAINING ONLY CONSTANTS -----"
module BearConstants
	EATS_HIKERS = true
	AWESOME_LEVEL = 10000
	KINGDOM = "Animalia"
	CLASS = "Mammalia"
	FAMILY = "Ursidae"
end

puts " ----- OUTPUT CONSTANT FROM MODULE -----"
puts BearConstants::CLASS

puts " ----- OUTPUT CONSTANT FROM GLOBAL NAMESPACE W/ SAME NAME AS CONSTANT FROM MODULE -----"
puts CLASS

puts " ----- CREATE A SECOND MODULE -----"
module DogConstants
	EATS_HIKERS = false
	AWESOME_LEVEL = 999999
	KINGDOM = "Animalia"
	CLASS = "Mammalia"
	FAMILY = "Canidae"
	ADORABLENESS_LEVEL = Float::INFINITY
end

puts " ----- OUTPUT CONSTANT FROM SECOND MODULE -----"
puts DogConstants::ADORABLENESS_LEVEL
puts " ----- OUTPUT CONSTANT FROM SECOND MODULE WITH SAME VALUE IN FIRST MODULE -----"
puts DogConstants::FAMILY
puts " ----- OUTPUT CONSTANT FROM FIRST MODULE WITH SAME VALUE IN SECOND MODULE -----"
puts BearConstants::FAMILY



puts "------------------------------------------------------------------------------------------"
################################################
#          MODULE FUNCTIONS & METHODS          #
################################################
puts "***************** MODULE FUNCTIONS & METHODS *****************"

puts " ----- CREATE MODULE W/ A MODULE METHOD, REGULAR METHOD, & MODULE_FUNCTION -----"
module DogBehaviour
	BARKING_NOISE = "WOOF"
	# A module method, callable from outside the module
	def self.sit # self is key - it won't be accessible from outside the module otherwise
		puts "(*dog sits down)"
	end
	# A method that is not a "module method". It is not callable from outside the module
	def bark
		puts "WOOF WOOF WOOF"
	end
	def speak
		puts "Hello this is dog"
	end
	# defines speak as a module function, making it accessible outside the module
	module_function :speak
end

puts " ----- CALL MODULE METHOD FROM OUTSIDE MODULE -----"
DogBehaviour::sit 			# => (*dog sits down)
	# ...OR...
DogBehaviour.sit 				# => (*dog sits down)

puts " ----- CALL A METHOD IN A MODULE THAT IS NOT A 'MODULE METHOD' - FROM OUTSIDE MODULE -----"
# DogBehaviour.bark 	# => undefined method `bark' for DogBehaviour:Module (NoMethodError)

puts " ----- CALL A MODULE FUNCTION FROM OUTSIDE THE MODULE -----"
DogBehaviour::speak	# => Hello this is dog
	# ...OR...
DogBehaviour.speak 	# => Hello this is dog

puts " ----- CALL A NON-'MODULE METHOD' FROM OUTSIDE MODULE WITH AN ANONYMOUS CLASS -----"
Class.new.extend(DogBehaviour)::bark # => WOOF WOOF WOOF
	# ...OR...
Class.new.extend(DogBehaviour)::bark # => WOOF WOOF WOOF


puts "------------------------------------------------------------------------------------------"
################################################################
#          CREATE A MODULE THAT INHERITS FROM ANOTHER          #
################################################################
puts "***************** CREATE A MODULE THAT INHERITS FROM ANOTHER *****************"



# module PermissionConstants
# 	READABLE_FLAG = "R"
# 	WRITABLE_FLAG = "W"
# 	EXECUTABLE_FLAG = "E"
# end
