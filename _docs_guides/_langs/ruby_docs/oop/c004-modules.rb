#!/usr/local/bin/ruby

# Modules allow you to group constants and methods together logically into 
# groups called namespaces, groups which organize modules and the like in 
# such a way as to avoid ambiguity and promote logical organization of code.
# 
# Namespaces: allow you to write larger groups of reusable code without the danger of
# stomping on other code outside of the namespace.
# 
# Modules only hold behaviour & constants - unlike classes which can also hold state
# Modules cannot be instantiated
# Module methods cannot be called directly - they must be mixed into another class
# 

# READABLE_FLAG = "r"
# WRITABLE_FLAG = "w"
# EXECUTABLE_FLAG = "e"

CLASS = "Drinking wine from the bottle level"

puts $SAFE

puts "------------------------------------------------------------------------------------------"
#######################################
#          IMPORTING MODULES          #
#######################################
puts "***************** IMPORTING MODULES *****************"

# puts " ----- IMPORT filesize MODULE -----"
# require "filesize"

# puts " ----- CREATE A NEW Filesize INSTANCE FROM THE IMPORTED MODULE -----"
# Filesize = Filesize.new()

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
########################################################
#          CREATE A MODULE CONTAINING A CLASS          #
########################################################
puts "***************** CREATE A MODULE CONTAINING A CLASS *****************"
module MyModuleFive
	class Bear
		def initialize roar_sound="roooooar"
			@roar_sound = roar_sound
		end
		def roar
			puts @roar_sound
		end
	end
end

puts " ----- INSTANTIATE CLASS WITHIN THE MODULE -----"
my_bear = MyModuleFive::Bear.new "Gr. arg."

puts " ----- RUN METHOD ON THE INSTANCE -----"
my_bear.roar

puts " ----- RUN A PIECE OF CODE AS IF IT'S IN THE SCOPE OF ANOTHER CLASS -----"
puts MyModuleFive.class_eval { puts "#{self::Bear}"}




puts "------------------------------------------------------------------------------------------"
###############################################
#          MIX A MODULE INTO A CLASS          #
###############################################
puts "***************** MIX A MODULE INTO A CLASS *****************"

puts " ----- CREATE MODULE Beat PROVIDING FUNCTIONS TO MANIPULATE A TRACK'S BEAT -----"

# Mixin providing a few simple beat manipulations
module Beat
	def speed_up pitch
		@bpm += pitch 
	end
	def speed_down pitch
		@bpm -= pitch 
	end
	def scratch
		"wakka wakka"
	end
end


# Container for data on the available synths for house tracks
module Synths
	SYNTHS = ['303', '808', '909', 'decks', 'sax', 'moog', 'amen', 'mc', 'wub'].freeze
end
p Synths::SYNTHS


# Class outlining the general structure of a specific house track
class HouseTrack
	include Beat

	def initialize bpm=120, length=420, synths=['303', '808', 'moog']
		@bpm = bpm
		@length = length
		@synths = synths
		@is_deep = determine_if_deep 
	end

	def drop_the_vinyl
		record unless @track
		puts @track.join(' ')
	end

	private
	def determine_if_deep
		if @bpm > 140 && @synths.include?('303')
			'false'
		elsif @bpm < 130 && @synths.include?('flute') || @synths.include?('sax')
			'true'
		else
			'maybe'
		end
	end

	def record
		track = [];
		(@bpm * @length / 60).to_i.times {|index|
			track.push 'boom'
			track.push 'chk'
			if @synths.include?('decks') && index % 16 == 0
				track.push scratch
			else
				if (@is_deep) && (index % 4 == 0)
					track.push 'barooh'
				end
				if @synths.include?('303') && index.even?
					track.push 'squeee'
				end
			end
		}
		@track = track
	end
end

bring_da_funk = HouseTrack.new 120, 120, ['303', 'decks']
bring_da_funk.speed_up 10
# bring_da_funk.record
bring_da_funk.drop_the_vinyl
# bring_da_funk.drop_the_vinyl.join(' ')


puts "------------------------------------------------------------------------------------------"
##############################################################################
#          INCLUDE A MODULE IN CLASS (RATHER THAN INSTANCE) METHODS          #
##############################################################################
puts "***************** INCLUDE A MODULE IN CLASS (RATHER THAN INSTANCE) METHODS *****************"

puts " ----- Define a module to include as part of a class' class variables -----"
module Greetings
	def aloha
		puts "aloha!"
	end
	def namaste
		puts "namaste!"
	end
end

puts " ---- New class; use extend to add module methods to class rather than instance methods ----"
class Phrases
	extend Greetings
	# class << self
	# 	include Greetings
	# end
	def cannot_speak_your_language
		puts "I cannot speak your language"
	end
end

puts " ----- Call the module method - attached to the class rather than the instance -----"
Phrases.namaste



puts "------------------------------------------------------------------------------------------"
####################################
#          NESTED MODULES          #
####################################
puts "***************** NESTED MODULES *****************"
module Deliveries
	def announce_arrival
		puts "Let me in, I'm here!"
	end

	module Vehicular
		def remove_delivery_from_vehicle
			puts "Shuffle shuffle shuffle, it sure is hard getting this out of the car"
		end

		def turn_off_car
			puts "car is now off!"
		end

		module Food
			def dispatch_pizza
				puts "omnomnom pizza"
			end
			def dispatch_tacos
				puts "omnomnom tacos"
			end
		end

		module SingingTelegram
			def dispatch_carols
				puts "falalalala...la la la la"
			end
			def dispatch_one_man_band
				puts "boom ding zoom wee shagalaga strum strum bump toot toot boom tick honk honk"
			end
		end

	end
end

puts " ----- Call an instance method on a nested module - using an empty temporary class -----"
Class.new.extend(Deliveries::Vehicular::Food).dispatch_tacos

puts " ----- We can't: 1) access module Z's sibling via module Z: their scopes are separate; -----"
# Class.new.extend(Deliveries::Vehicular::Food).dispatch_carols 		# => THROWS AN ERROR

puts " ----- 2) access module Z by including its parent but not module Z itself; -----"
# Class.new.extend(Deliveries::Vehicular).dispatch_tacos 						# => THROWS AN ERROR

puts " ----- 3) access module Z's parent module by including module Z -- no inheritance. -----"
# Class.new.extend(Deliveries::Vehicular::Food).turn_off_car 						# => THROWS AN ERROR

puts ""
puts " ---- Extend module w/ its own instance methods; Allows direct calls to module methods. ----"
puts "STEP 1  :::     Deliveries::Vehicular::Food.extend(Deliveries::Vehicular::Food)"
puts "STEP 2  :::     Deliveries::Vehicular::Food.dispatch_pizza"
puts "- RESULT (below) -"
Deliveries::Vehicular::Food.extend(Deliveries::Vehicular::Food)
Deliveries::Vehicular::Food.dispatch_pizza

# TODO ::::: figure out how to call module method from another module method


puts "------------------------------------------------------------------------------------------"
#############################################################
#          DETERMINE WHAT MODULES A CLASS INCLUDES          #
#############################################################
puts "***************** DETERMINE WHAT MODULES A CLASS INCLUDES *****************"
module FastMovement

	def run
		puts "Run run run run run!"
	end
	def sprint
		puts "Weeeeee! ERMAGERD I SPRINTSES SO FAST!!!"
	end
	def break_sound_barrier
		puts "BOOOOOOOOOOOOOOOOOOOOOOOOOOM!!!!!!"
	end
end

class Legs
	include FastMovement
	def walk
		puts "I'm a walkin'!"
	end
	def transport_owner movement_type="walk"
		self.send movement_type

		# 		puts "\n\nDynamically assigning variable to own method."
		# puts "got the method:"
		# walk_move = self.method("walk")
		# 		p walk_move
		# 		puts "methods available on the method:"
		# 		p walk_move.methods.sort
		# 		puts "initial instance variables on the method:"
		# 		p walk_move.instance_variables
		# puts "added an instance variable"
		# walk_move.instance_variable_set(:@requires_legs, true)
		# puts "retrieved the instance variable"
		# puts walk_move.instance_variable_get(:@requires_legs)
		# p self.class.instance_methods.sort
		# puts "overwriting local method with altered one:"
		# self.define_method(:walk, walk_move)

		# # walk_move.parameters
	
		# puts "\n\nReceivers etc."
		# p self.method("walk").receiver
		# p self.method("walk").receiver.methods.sort
		# p self.method("walk").instance_variable_set("@uses_legs", true)
		# self.method("walk").instance_variable_get("@uses_legs")
	end
end

my_legs = Legs.new
my_legs.transport_owner

puts "------------------------------------------------------------------------------------------"
##############################################################################
#          USE MODULES TO MAKE A NAMESPACED COLLECITON OF FUNCTIONS          #
##############################################################################
puts "***************** USE MODULES TO MAKE A NAMESPACED COLLECITON OF FUNCTIONS *****************"
puts " ----- MAKE A MODULE CONTAINING FUNCTIONS -----"
# class Money

# 	module BillTypes
# 		['1', '5', '10', '20', '50', '100', '1000', '5000'].each 
# 		ALL_BILLS = [ONE_DOLLAR_BILL = 'one dollar bill', ]
# 	end
# 	def initialize
# 		bill_type
# 	end
# end

# module DuctTape
# 	class DuctTapeWallet
# 		def initialize(initial_cash = 0)
# 			@cash = initial_cash
# 		end
# 		def take_out_cash(amount_to_withdraw)
# 			@cash = @cash - amount_to_withdraw
# 			puts "Wallet now contains $#{@cash}."
# 			amount_to_withdraw
# 		end
# 	end
# 	def tape_together(item1, item2)
# 		"#{item1.to_s} is now taped to #{item2.to_s}"
# 	end

# 	def make_duct_tape_wallet

# 		"#{item1.to_s} is now taped to #{item2.to_s}"
# 	end

puts "------------------------------------------------------------------------------------------"
################################################################
#          CREATE A MODULE THAT INHERITS FROM ANOTHER          #
################################################################
# puts "***************** CREATE A MODULE THAT INHERITS FROM ANOTHER *****************"
# module 


puts "------------------------------------------------------------------------------------------"
#########################################
#          MIXINS WITH MODULES          #
#########################################
puts "***************** MIXINS WITH MODULES *****************"

puts " ----- DEFINE A MODULE WITH A FUNCTION -----"
module EatsHikers

	def eat_hiker
		p "#{(instance_variable_defined?('@name')) ? @name : self.class.to_s} ate a hiker!"
	end

	private
	class Boneyard
	end
end

puts " ----- DEFINE A CLASS THAT INCLUDES THE PRECEDING MODULE - THUS ACTING LIKE A MIXIN -----"
class Bear
	include EatsHikers
	def initialize name, age, favorite_food
		@name = name
		@age = age
		@favorite_food = favorite_food
		@things_eaten = 0
	end
end

pooh = Bear.new 'Pooh', 4, 'honey'
pooh.eat_hiker 							# => # => "Pooh ate a hiker!"


class Tiger
	include EatsHikers
	def initialize age, hyenas_eaten=0
		@age = age
		@hyenas_eaten = hyenas_eaten
	end
	def eat_hyena
		@hyenas_eaten += 1
		p "Tiger ate a hyena!"
	end
end

my_tiger = Tiger.new 4, 1
my_tiger.eat_hyena					# => "Tiger ate a hyena!"
my_tiger.eat_hiker 					# => # => "Tiger ate a hiker!"



puts "------------------------------------------------------------------------------------------"
###################################################
#          LIFECYCLE METHODS / CALLBACKS          #
###################################################
puts "***************** self.included CALLBACK *****************"

puts " ----- Make a module w/ a self.included cb, to run when module is mixed into a class  -----"
module Foo
	def self.included class_that_module_is_being_mixed_in_to
		puts "module Foo was included in #{class_that_module_is_being_mixed_in_to.name}"		
	end
end

puts " ----- Make a class that mixes in in the module containing the self.included callback -----"
class Bar
	include Foo 
end
# => module Foo was included in Bar


puts "***************** self.extended CALLBACK *****************"
# https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/48-advanced-modules/lessons/118-wrapping-up-modules
# TODO
# TODO
# TODO



puts "------------------------------------------------------------------------------------------"

puts "------------------------------------------------------------------------------------------"
######################################################################
#          MODULE-LEVEL METHODS     &     REOPENING MODULES          #
######################################################################
puts "***************** MODULE-LEVEL METHODS & REOPENING MODULES *****************"
puts " ----- Create module with a method. Make it externally available with module_function -----"

module Digest
	def put_in_mouth food="food"
		puts "Just put #{food} in mouth! Preparing to digest it. Omnomnomnom."
	end
	module_function :put_in_mouth
end

Digest.put_in_mouth 			# => Just put food in mouth! Preparing to digest it. Omnomnomnom.

puts " ----- Reopen module by redeclaring it as w/ initial definition, w extra methods added -----"
module Digest
	def drink liquid="liquid"
		puts "Just drank #{liquid}!"
	end
	module_function :drink
end

puts " ----- Run new method added to the module  -----"
Digest.drink 					# => Just drank liquid!

puts " ----- Rerun method initially declared on the module (note that it still works :) )  -----"
Digest.put_in_mouth 			# => Just put food in mouth! Preparing to digest it. Omnomnomnom.


puts "------------------------------------------------------------------------------------------"
#################################################################
#          INCLUDING MODULES CONTAINING NESTED MODULES          #
#################################################################
puts "***************** INCLUDING MODULES CONTAINING NESTED MODULES *****************"
module TestOuterModule
	module TestInnerModuleClassMethods
		def hello_one
			puts "hello! I'm in inner module TestInnerModuleClassMethods! "
		end
	end
	
	module TestInnerModuleInstanceMethods
		def hello_two
			puts "hello! I'm in TestInnerModuleInstanceMethods!"
		end		
	end
	
	def self.included(receiver)
		receiver.extend         TestInnerModuleClassMethods
		receiver.send :include, TestInnerModuleInstanceMethods
	end
end

class EatsModule
	include TestOuterModule
	def say_hello
		puts "ran say_hello"
		hello_two		 							 # run one of the instance methods
		self.class.send :hello_one # run one of the class methods
	end
end

puts " ----- Instantiate EatsModule (create eatsModule). ------"
puts " ----- This does an 'include' of TestOuterModule, & thus runs its self.included method -----"
eatsModule = EatsModule.new

puts " ----- Run eatsModule method that calls methods from each inner module in TestOuterModule -----"
eatsModule.say_hello
# From within eatsModule's say_hello instance method, the method from TestInnerModuleInstanceMethods 
# is called using a regular method call - hello_two; while the method from TestInnerModuleClassMethods
# can only be called from within the say_hello method by explicitly sending a method to self.class
