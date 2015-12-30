#!/usr/local/bin/ruby



puts "------------------------------------------------------------------------------------------"
####################################################################
#           GET/SET INSTANCE VARIABLES WITHOUT ACCESSORS           #
####################################################################
puts "***************** GET/SET INSTANCE VARIABLE WITHOUT ACCESSORS *****************"

puts " ----- DEFINE CLASS THAT TAKES 2 PARAMS AND MAKES THEM INSTANCE VARIABLES -----"
class TwoSimpleParams
	def initialize(p1, p2)
		@p1 = p1
		@p2 = p2
	end
end

puts " ----- INSTANTIATE CLASS -----"
two_params = TwoSimpleParams.new("param 1", "param 2")

puts " ----- GET AN INSTANCE VARIABLE THAT WAS DEFINED WHEN THE OBJECT WAS INITIALIZED-----"
puts two_params.instance_variable_get(:@p1)	# => "param 1"

puts " ----- SET A NEW VALUE FOR AN INSTANCE VARIABLE ON THE OBJECT -----"
two_params.instance_variable_set(:@p1, "yay!")

puts " ----- GET THE INSTANCE VARIABLE THAT HAD A NEW VALUE SET -----"
puts two_params.instance_variable_get(:@p1)	# => "yay!"

puts " ----- GET AN INSTANCE VARIABLE USING A STRING (DYNAMICALLY) -----"
name_of_param = "p1"
puts two_params.instance_variable_get("@" + name_of_param)	# => "yay!"

puts " ----- CREATE A NEW INSTANCE VARIABLE, WITH NAME DYNAMICALLY SET FROM A STRING -----"
new_param_name = "woo"
two_params.instance_variable_set("@#{new_param_name}".to_sym, "wooooot!")

puts " ----- OUTPUT NEW DYNAMICALLY CREATED INSTANCE VARIABLE -----"
puts two_params.instance_variable_get("@" + new_param_name) # => "wooooot!"



puts "------------------------------------------------------------------------------------------"
##################################################
#          DYNAMICALLY CREATE ACCESSORS          #
##################################################
puts "***************** DYNAMICALLY CREATE ACCESSORS *****************"

puts " ----- CREATE CLASS THAT DYNAMICALLY CREATES ACCESSORS -----"

class DynamicAccessorAllower
	def initialize(accessor_name, value = "")
		make_accessor(accessor_name, value)
	end

	def make_accessor(accessor_name, value = "")
		instance_variable_set("@#{accessor_name}", value)
		self.class.send(:attr_accessor, accessor_name)
	end
end

puts " ----- INSTANTIATE CLASS -----"
dynamic_accessor_allower = DynamicAccessorAllower.new("access_with_me", "accessor returned me!")

puts " ----- CALL INSTANCE VARIABLE WITH GETTER -----"
puts dynamic_accessor_allower.instance_variable_get(:@access_with_me) # => accessor returned me

puts " ----- CALL INSTANCE VARIABLE WITH ACCESSOR - BY REQUESTING THE VARIABLE DIRECTLY -----"
puts dynamic_accessor_allower.access_with_me
