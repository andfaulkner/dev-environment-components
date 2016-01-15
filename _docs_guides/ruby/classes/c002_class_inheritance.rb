#!/usr/bin/ruby


puts "------------------------------------------------------------------------------------------"
#################################
#          SUBCLASSING          #
#################################
puts "***************** SUBCLASSING *****************"

class Animal
	attr_reader :sex, :name
	def initialize(sex, name = "NONAME")
		@sex = sex
		@name = name
		puts "#{name} was born! It's a #{sex}!"
	end
	def breathe
		puts 'animal breathed!'
	end
end

class Mammal < Animal
	def lactate
		puts 'animal produced milk!' if @sex == "female"
	end
end

some_animal = Animal.new("girl", "some_animal")
some_animal.breathe

meeka = Mammal.new("female", "Meeka")
meeka.lactate