#!/usr/bin/env ruby


puts "------------------------------------------------------------------------------------------"
#####################################################
#          MODULES TO ADD INSTANCE METHODS          #
#####################################################
puts "***************** MODULES TO ADD INSTANCE METHODS *****************"

module AddsMethodsIfMixedIn
	def hello
		puts "hello!"
	end
	def hello_name(other_name)
		puts "#{@name} says hello to #{other_name}!"
	end
end

# receive instance methods
class Greeter
	include AddsMethodsIfMixedIn
	def initialize(name)
		@name = name		
	end
end

puts Greeter.new("meeka").hello_name("callie") # => meeka says hello to callie!


puts "------------------------------------------------------------------------------------------"
##################################################
#          MODULES TO ADD CLASS METHODS          #
##################################################
puts "***************** MODULES TO ADD CLASS METHODS *****************"
puts " ----- ALSO MULTIPLE EXTENSION -----"
module EnglishGreetings
	def hello
		puts "hello!"
	end
	def good_morning
		puts "good morning!"
	end
end

module HawaiianGreeting
	def aloha
		puts "aloha!"
	end
end

class Greet
	extend EnglishGreetings
	extend HawaiianGreeting
end

Greet.hello # => hello!
Greet.aloha # => aloha!


puts "------------------------------------------------------------------------------------------"
#########################################################################
#          ADD BOTH CLASS AND INSTANCE METHODS FROM ONE MODULE          #
#########################################################################
puts "***************** ADD BOTH CLASS AND INSTANCE METHODS FROM ONE MODULE *****************"

module AddClassAndInstanceMethods
	module ClassMethods
		def class_method_one
			puts "class method one is called!"
		end
	end
	
	module InstanceMethods
		def instance_method_one
			puts "instance method one is called!"
		end
	end
	
	def self.included(receiver) # => a lifecycle method
		receiver.extend         ClassMethods
		receiver.send :include, InstanceMethods
	end
end

class GetEmAll
	include AddClassAndInstanceMethods
end

GetEmAll.class_method_one # => class method one is called!
# GetEmAll.instance_method_one # <<<< this would fail

getem = GetEmAll.new
getem.instance_method_one # => instance method one is called!