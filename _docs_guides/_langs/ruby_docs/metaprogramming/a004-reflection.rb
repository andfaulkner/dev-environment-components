#!/usr/bin/env ruby

puts "------------------------------------------------------------------------------------------"
######################################################
#          GET LISTS OF DECLARED VARIABLES           #
######################################################
puts "***************** RETURN A LIST OF ALL GLOBAL VARIABLES *****************"
puts global_variables

puts "***************** RETURN A LIST OF ALL LOCAL VARIABLES *****************"
puts local_variables

puts "------------------------------------------------------------------------------------------"
################################################
#          GET NAME OF CURRENT OBJECT          #
################################################
puts "***************** GET NAME OF CURRENT OBJECT *****************"

puts " ----- GET NAME OF CURRENT METHOD -----"
def my_method
	puts __method__
end

my_method

puts " ----- GET NAME OF CURRENT CLASS -----"
class MyClass
	def initialize
		puts "--GET POINTER TO CLASS. self.class IS THE CLASS NOT THE NAME (tho name shows in cli)--"
		puts self.class 									 # => MyClass <<< Pointer to MyClass obj; not a class name
		puts "--DETERMINES IF CLASS NAME OR CLASS, BY ASKING IF IT'S A STRING (IF NO IT'S THE CLASS)--"
		puts self.class.is_a?(String)			 # => false   <<< false because it's a MyClass, not a String
		puts " ----- GET ACTUAL CLASS NAME. LOOKS SAME AS THE POINTER, BUT TYPE IS STRING -----"
		puts self.class.name 							 # => MyClass <<< Actually gives us the name of the class 
		puts "--SHOWS THAT WE HAVE THE CLASS NAME IF true (true means IT'S TYPE STRING)--"
		puts self.class.name.is_a?(String) # => true  	<<< true because it's a name: names are Strings
	end
end

MyClass.new

def get_module_name
  @module_name = self.class.to_s.split("::").first
end




puts "------------------------------------------------------------------------------------------"
##################################
#          METHOD LISTS          #
##################################
puts "***************** METHOD LISTS *****************"
puts " ----- CREATE CLASS WITH 2 TEST METHODS -----"
class GrizzlyBear
	attr_accessor :favorite_foods
	GOES_ON_MURDEROUS_RAMPAGES = true
	def initialize(favorite_foods = ["hikers", "picnic baskets"])
		@favorite_foods = favorite_foods
	end
	def roar
		puts "RAAAAAAR!!!"
	end
	def hibernate(number_of_months = 6)
		puts "bear is going to sleep for #{number_of_months} months"
		cry
	end
	private
	def cry
		puts "*bear secretly cries because he is too awesome for this cruel cruel world*"
	end
end

puts " ----- GET LIST OF ALL METHODS ACCESSIBLE FROM INSTANCES OF A CLASS -----"
p GrizzlyBear.instance_methods.sort

puts " ----- LIST INSTANCE METHODS DEFINED ON CLASS ITSELF (NOT ITS ANCESTORS) -----"
# this includes generated accessor methods
p GrizzlyBear.instance_methods(false).sort 	
			# => [:favorite_foods, :favorite_foods=, :hibernate, :roar]

puts " ----- LIST PRIVATE INSTANCE METHODS DEFINED ON CLASS ITSELF (NOT ITS ANCESTORS) -----"
p GrizzlyBear.private_instance_methods(false).sort # => [:cry, :initialize]


puts "------------------------------------------------------------------------------------------"
#############################################
#          LIST INSTANCE VARIABLES          #
#############################################
puts "***************** LIST INSTANCE VARIABLES *****************"

puts " ----- LIST CLASS' INSTANCE VARIABLES (by calling the class itself) -----"
p GrizzlyBear.instance_variables # => []  <<< none, because these are assigned on instantiation

puts " ----- INSTANTIATE TEST CLASS -----"
gr_arg_bear = GrizzlyBear.new

puts " ----- LIST INSTANCE VARIABLES OF INSTANCE OF CLASS (calls instance obj not class obj) -----"
p gr_arg_bear.instance_variables # =>	[:@favorite_foods]


puts "------------------------------------------------------------------------------------------"
###############################
#          RUBY INFO          #
###############################
puts "***************** RUBY INFO *****************"

puts " ----- GET RUBY VERSION -----"
p RUBY_VERSION 		# => "2.3.0"

puts " ----- GET RUBY PLATFORM AKA THE OS IT'S RUNNING ON -----"
p RUBY_PLATFORM 	# => "x86_64-linux"

puts " ----- GET RUBY ENGINE (SHOULD PROBABLY ALWAYS BE ruby) -----"
p RUBY_ENGINE 		# => "ruby"


puts "------------------------------------------------------------------------------------------"
########################################################
#          CHECK IF INSTANCE HAS GIVEN METHOD          #
########################################################
puts "***************** CHECK IF INSTANCE HAS GIVEN METHOD *****************"

puts " ----- Define a basic class with a couple of methods, for test purposes -----"
class Kingfisher
	def initialize(name="fisher")
		@name = name
	end
	def kill_leash_rat
		puts "#{name} just killed a leash rat! I guess fishers are good for something after all"
	end
end

puts " ----- Instantiate the test class -----"
my_fisher = Kingfisher.new "gr arg"

puts " ----- Test for the presence of a method w/ my_instance_here.respond_to?(:methodname) -----"
puts my_fisher.respond_to?(:kill_leash_rat) # => true
puts my_fisher.respond_to?(:aeghaerhu) 			# => false
