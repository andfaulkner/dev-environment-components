#!/usr/local/bin/ruby


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


puts "------------------------------------------------------------------------------------------"
####################################
#          VIEW ANCESTORS          #
####################################
puts "***************** VIEW ANCESTORS *****************"

puts " ----- VIEW ANCESTORS OF A CLASS -----"
p Animal.ancestors
# => [Animal, Object, Kernel, BasicObject]

puts " ----- VIEW ANCESTORS OF AN INSTANCE'S CLASS -----"
p meeka.class.ancestors
# => [Animal, Object, Kernel, BasicObject]


puts "------------------------------------------------------------------------------------------"
################################
#          CALL SUPER          #
################################
puts "***************** CALL SUPER *****************"
class Dog < Mammal
	#overrides initialize in class Mammal
	def initialize(bark_sound="arf", *args)
		@bark_sound = bark_sound
		# pass the rest of the args up
		super(*args)
	end
	def bark
		puts "#{@name} goes #{@bark_sound}"
	end	
end

meeka_two = Dog.new("woof", "girl", "meeka two")

meeka_two.bark

