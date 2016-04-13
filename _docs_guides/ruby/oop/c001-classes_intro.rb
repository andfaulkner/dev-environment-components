#!/usr/local/bin/ruby


puts "------------------------------------------------------------------------------------------"
###########################################
#          GET AN OBJECT'S CLASS          #
###########################################
puts "***************** GET AN OBJECT'S CLASS *****************"
p "something".class #=> String
p [].class # => Array
p 7.class # => Fixnum
p 


puts "\n------------------------------------------------------------------------------------------"
######################################
#          DEFINING A CLASS          #
######################################
puts " ************** DEFINE A CLASS **************"
class PersonEmpty
end

puts " ------ INSTANTIATE CLASS ------"
empty_person = PersonEmpty.new
puts empty_person # => #<PersonEmpty:0x00000001aa3498> 		# this doesn't provide much

puts "------------------------------------------------------------------------------------------"
#################################################################
#          METHODS IN A CLASS (BUT NOT CLASS METHODS!)          #
#################################################################
puts " ************** DECLARE A CLASS WITH A METHOD **************"
class PersonWithAMethod
	def declare_personhood
		"I am a person"
	end
	def say_hello_to name
		"hello #{name}!"
	end
	def say_hello_to_someone_or_johnny name="johnny"
		"hello #{name}!"
	end
end

puts " ------ INSTANTIATE CLASS WITH METHOD ------"
person_with_one_method = PersonWithAMethod.new

puts " ------ CALL METHOD ON INSTANTIATED CLASS ------"
puts person_with_one_method.declare_personhood # => I am a person

puts " ------ CALL METHOD ON INSTANTIATED CLASS WITH PARAM GIVEN ------"
puts person_with_one_method.say_hello_to "moomler" # => hello moomler!

puts " ------ CALL METHOD WITH DEFAULT PARAM ON INSTANTIATED CLASS, NO PARAM GIVEN ------"
puts person_with_one_method.say_hello_to_someone_or_johnny  # => hello johnny!

puts " ------ CALL METHOD WITH DEFAULT PARAM ON INSTANTIATED CLASS, WITH PARAM GIVEN ------"
puts person_with_one_method.say_hello_to_someone_or_johnny "moomroom" # => hello moomroom!

# default values for each param can be given

puts "------------------------------------------------------------------------------------------"
#######################################################
#          'INITIALIZE' METHOD (CONSTRUCTOR)          #
#######################################################
# method named initialize is special - it runs when new is invoked
puts " ************************** INITIALIZE METHOD (CONSTRUCTOR) **************************"

puts " ************** DEFINE A CLASS WITH A CONSTRUCTOR **************"
class PersonWithConstructor
	def initialize name="\[NoName\]"	# Note the default value (Not required)
		@name = name # @name gets stored in the instance 
	end
	def say_hi
		"#{@name} says hi!"
	end
end

puts " ----- CALL METHOD ON CLASS WITH CONSTRUCTOR INSTANTIATED WITH NO PARAMS -----"
no_name = PersonWithConstructor.new
puts no_name.say_hi

puts " ----- CALL METHOD ON CLASS WITH CONSTRUCTOR INSTANTIATED WITH A PARAM -----"
meeka = PersonWithConstructor.new "meeka"
puts meeka.say_hi # => meeka says hi!

puts " ----- GET INSTANCE METHODS A CLASS HAS -----"
puts PersonWithConstructor.instance_methods false

puts "------------------------------------------------------------------------------------------"
############################################
#          PROPERTIES & ACCESSORS          #
############################################
puts " ************************** PROPERTIES AND ACCESSORS **************************"

# properties can't be accessed directly
# e.g. meeka.@name <-- no dice

puts " ----- GET INSTANCE VARIABLE DIRECTLY WITH instance_variable_get -----"
puts meeka.instance_variable_get "@name" # => meeka

puts " ----- DEFINE A CLASS WITH AN ACCESSOR -----"
class PersonWithAccessor
	attr_accessor :name
end

puts " ----- SET THEN GET PROPERTY OF INSTANCE USING AN ACCESSOR -----"
person_with_accessor = PersonWithAccessor.new
person_with_accessor.name = "a name!"
puts person_with_accessor.name # => a name!

puts " ----- DEFINE A CLASS WITH AN ACCESSOR AND INTERNAL METHOD THAT ACCESSES IT -----"
class PersonWithAccessorAndAccessingMethod
	attr_accessor :name
	def initialize name="\[DEFAULT\]"
		@name = name
	end
end

puts " ----- INSTANTIATE CLASS WITH ACCESS AND INTERNAL METHOD THAT ACCESSES IT -----"
person_with_accessor_and_accessing_method = PersonWithAccessorAndAccessingMethod.new
puts person_with_accessor_and_accessing_method.name # => [DEFAULT]

puts "------------------------------------------------------------------------------------------"

puts " ----- DEFINE A CLASS WITH A READ-ONLY ACCESSOR -----"
class PersonWithReadOnlyAccessor
	attr_reader :name
	def initialize name="\[DEFAULT\]"
		@name = name
	end
end

puts " ----- READ AND OUTPUT READ-ONLY ACCESSIBLE PROPERTY -----"
person_with_read_only_accessor = PersonWithReadOnlyAccessor.new("mooma")
puts person_with_read_only_accessor.name # => mooma
# person_with_read_only_accessor.name = "new name!" # => throws error! You can't do that

puts " ----- DEFINE A CLASS WITH MULTIPLE ACCESSORS -----"
class PersonWithThreeReadOnlyAccessors
	attr_reader :name, :age, :time_created
	def initialize name="\[DEFAULT\]", age=20
		@name = name
		@age = age
		@time_created = Time.now
	end
end

puts " ----- INSTANTIATE CLASS WITH MULTIPLE ACCESSORS, OUTPUT DATA FROM READ-ONLY ACCESSORS -----"
person_w_3_read_accessors = PersonWithThreeReadOnlyAccessors.new "moomarooma", 25
puts "#{person_w_3_read_accessors.name} is age #{person_w_3_read_accessors.age}"
puts "#{person_w_3_read_accessors.name} was created at #{person_w_3_read_accessors.time_created}"

puts "------------------------------------------------------------------------------------------"


puts "------------------------------------------------------------------------------------------"
##############################################################
#          CLASS-LEVEL DATA (PROPERTIES, CONSTANTS)          #
##############################################################
puts "***************** CLASS-LEVEL DATA (PROPERTIES, CONSTANTS) *****************"

puts " ----- DEFINE A CLASS WITH A CLASS CONSTANT -----"
class PersonWithClassConstant
	SPECIES = "homo sapien"
	def initialize name="\[DEFAULT\]"
		puts "person has been born!"
	end
end

puts " ----- OUTPUT CLASS CONSTANT FROM THE CLASS OBJECT -----"
puts PersonWithClassConstant::SPECIES 			# => homo sapien

puts " ----- INSTANTIATE CLASS WITH A CLASS CONSTANT -----"
person_with_class_constant = PersonWithClassConstant.new

puts " ----- OUTPUT CLASS CONSTANT FROM THE INSTANCE OF THE CLASS -----"
puts person_with_class_constant.class::SPECIES 	# => homo sapien 

puts "------------------------------------------------------------------------------------------"

puts " ----- DEFINE A CLASS WITH A CLASS LEVEL VARIABLE -----"
class PersonWithClassLevelVariable
	def PersonWithClassLevelVariable.get_latest
		puts "The latest person is #{@@latest}"
	end
	def initialize name
		@@latest = name
	end
end

puts " ----- 1: INSTANTIATE ONCE THEN OUTPUT CLASS-LEVEL VARIABLE FROM THE CLASS OBJECT -----"
jacky_o_hare = PersonWithClassLevelVariable.new 'jacky o hare'
puts PersonWithClassLevelVariable.get_latest

puts " ----- 2: INSTANTIATE THEN OUTPUT CLASS-LEVEL VARIABLE FROM THE CLASS OBJECT AGAIN -----"
johnny_d = PersonWithClassLevelVariable.new('johnny d')
puts PersonWithClassLevelVariable.get_latest

puts " ----- GET CLASS LEVEL VARIABLE VALUE FROM AN INSTANCE OF THE CLASS -----"
johnny_d.class::get_latest

puts "------------------------------------------------------------------------------------------"


puts "------------------------------------------------------------------------------------------"
#######################################
#          REOPENING A CLASS          #
#######################################
puts "***************** REOPENING A CLASS *****************"
puts " ----- DEFINE AN INTIAL CLASS (TO BE REOPENED LATER) -----"
class Dog
	def initialize name="meeka", bark_sound="woof"
		@name = name
		@bark_sound = bark_sound
	end
end

puts " ----- REOPEN THE CLASS, ADD A METHOD TO IT -----"
class Dog
	def bark
		p "#{@name} goes #{@bark_sound}!"
	end
end


puts " ----- INSTANTIATE CLASS & CALL A METHOD THAT USES BOTH PART OF THE CLASS DEFINITION -----"
meeka = Dog.new "meeka", "roawowowowowoof"

meeka.bark


puts "------------------------------------------------------------------------------------------"
###################################
#          CLASS METHODS          #
###################################
# accessible form both instances and the class itself
puts "***************** CLASS METHODS *****************"
puts " ----- CREATE A CLASS METHOD -----"
class Chicken
	def initialize name
		@name = name
	end
	def self.has_feathers?
		'chickens have feathers'		# <<<<< This is a class method
	end
end

puts " ----- CALL A CLASS METHOD FROM THE CLASS ITSELF-----"
p Chicken::has_feathers?		   		# => "chickens have feathers"

puts " ----- CALL A CLASS METHOD FROM AN INSTANCE BY REFERENCING THE CLASS -----"
cluckeroo = Chicken.new 'cluckeroo'
p cluckeroo.class.has_feathers?   # => "chickens have feathers"
# p cluckeroo.has_feathers?  <<< can't do this; you must reference the class that made the object


puts "------------------------------------------------------------------------------------------"
#####################################
#          CLASS VARIABLES          #
#####################################
#  Rarely needed
#  Used for application configuration, however
puts "***************** CLASS VARIABLES *****************"
class CatDog
	COMPONENT_ANIMALS = ['cat', 'dog']  # class constant

	@@number_created = 0								# class variable
	@@most_recent = nil									# class variable

	attr_accessor :cat_sound, :dog_sound
	attr_reader :most_recent

	def initialize cat_name, dog_name, cat_sound, dog_sound
		@cat_name = cat_name
		@dog_name = dog_name
		@cat_sound = cat_sound
		@@number_created = @@number_created + 1
		@@most_recent = Time.now
	end

	# allows us to return the class variable
	def self.num_created
		@@number_created
	end
end

meeka_kyra = CatDog.new'Kyra', 'Meeka', 'hisssssss', 'ararararararararagrrrrroawoawoaw'
p meeka_kyra

p CatDog::num_created

meeka_kyra2 = CatDog.new'Kyra', 'Meeka', 'hisssssss', 'ararararararararagrrrrroawoawoaw'

p CatDog::num_created




puts "------------------------------------------------------------------------------------------"
################################################
#          CLASS VARIABLE INHERITANCE          #
################################################
puts "***************** CLASS VARIABLE INHERITANCE *****************"
# Create a base class
puts " ----- CREATE A BASE CLASS -----"
class ApplicationConfig
	@@configuration = { 'number_of_apps' => 0 }
	def self.set(property, value)
		@@configuration[property] = value
	end
	def self.get(property)
		@@configuration[property]
	end
end

puts " ----- CREATE 2 INHERITING CLASSES -----"
class FavoriteBearAppConfig < ApplicationConfig
end

class WhatBearAreYouAppConfig < ApplicationConfig
end

puts " ----- GET THE EXISTING # OF APPS IN 1 CHILD & ADD 1 TO IT. DO THE SAME WITH THE OTHER -----"
puts " ----- SHOW THE DEFAULT VALUE FOR configuration['number_of_apps'] -----"
p FavoriteBearAppConfig.get "number_of_apps" # => 0

puts " ----- GET configuration['number_of_apps'] FROM FavoriteBearAppConfig & INCREMENT BY 1 -----"
FavoriteBearAppConfig.set "number_of_apps", (FavoriteBearAppConfig.get "number_of_apps") + 1

puts " ---- GET configuration['number_of_apps'] FROM WhatBearAreYouAppConfig & INCREMENT BY 1 ----"
WhatBearAreYouAppConfig.set "number_of_apps", (WhatBearAreYouAppConfig.get "number_of_apps") + 1

puts " ----- GET number_of_apps' VAL AFTER 1 INCREMENT IN EACH ApplicationConfig CHILD CLASS -----"
p FavoriteBearAppConfig.get("number_of_apps") # => 2

# This occurs because both are actually accessing a class variable in their mutual parent.
 
# FavoriteBearAppConfig.set('number_of_apps', 3000)
# WhatBearAreYouAppConfig.set('port', 3010)

puts " ----- NOTICE THAT THE VALUE IS 2 FOR BOTH CLASSES. THIS IS BECAUSE  -----"
puts " ----- CLASS VARIABLES - INCLUDING THEIR VALUES - ARE SHARED WITH CHILD CLASSES -----"
p FavoriteBearAppConfig.get :number_of_apps 			# => 2
p WhatBearAreYouAppConfig.get :number_of_apps 		# => 2



puts "------------------------------------------------------------------------------------------"
##############################################
#          CLASS INSTANCE VARIABLES          #
##############################################
puts "***************** CLASS INSTANCE VARIABLES *****************"

puts " ----- DEFINE A CLASS WITH A CLASS INSTANCE VARIABLE -----"
class Bird
	@bird_count = 0	# <<<<<<<<<<<< class instance variable. Inaccessible from outside w/out a method
	def self.increment_num_birds
		@bird_count += 1
	end
	def self.current_bird_count
		@bird_count
	end
end

puts " ----- MAKE 2 CHILD CLASSES. GIVE EACH A DIFFERENT VAL FOR THE CLASS INSTANCE VAR -----"
class Duck < Bird
	@bird_count = 10
end

class Quayle < Bird
	@bird_count = 7
end

puts " ----- EACH CHLD GETS ITS OWN DISCRETE INSTANCE OF THE CLASS VARIABLE, FOR CLASS -----"
puts " ----- INSTANCE VARIABLES, SO EACH CAN HAVE THEIR OWN UNIQUE VALUE FOR IT -----"
p Duck.current_bird_count 		#=> 10
p Quayle.current_bird_count 	#=> 7

# the data is not shared across the inheritance chain here, other than on initialization

puts " ----- NOTE THAT CLASS INSTANCE VAR'S VAL ISN'T INHERITED FROM PARENT -----"
class Pheasant < Bird
end
p Pheasant.current_bird_count #=> nil  <<<< class instance var's value isn't inherited from parent



puts "------------------------------------------------------------------------------------------"
##########################
#          self          #
##########################
puts "***************** self *****************"
# self is the instance in which the code is executed
			# inside a method definition: 		 the instance on which the method is defined.
			# inside class/module definition:  the class/module being defined

class TestSelf
	puts self 		# <<< self refers to class TestSelf here
	def f
		puts self
		return self # <<< self refers to an __instance__ of TestSelf here. [**1**]
	end
end 
# [**1**]E.g. if this was a string object. self would be the actual string, such as "hello" or " a"

puts self 			# => main
puts self.class # => Object




puts "------------------------------------------------------------------------------------------"
#############################################################
#          RUNNING CODE IN SCOPE OF OTHER CLASSES           #
#############################################################
puts "***************** RUNNING CODE IN SCOPE OF OTHER CLASSES  *****************"
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
my_bear = MyModuleFive::Bear.new("Gr. arg.")

puts " ----- RUN METHOD ON THE INSTANCE -----"
my_bear.roar

puts " ----- RUN A PIECE OF CODE AS IF IT'S IN THE SCOPE OF ANOTHER CLASS -----"
puts MyModuleFive.class_eval { puts "#{self::Bear}"}



puts "------------------------------------------------------------------------------------------"
############################################################
#          RETURN CLASS FROM FREE-FLOATING METHOD          #
############################################################
puts "***************** RETURN CLASS FROM FREE-FLOATING METHOD *****************"
puts " ----- MAKE A CLASS TO BE RETURNED -----"
class Dog
	def initialize
		p 'I am a dog'
	end
	def bark
		p 'woof woof woof'
	end
end

puts " ----- MAKE A METHOD FOR RETURNING THE CLASS  -----"
def factory
	Dog
end

puts " ----- RUN CLASS-BUILDING FUNCTION, INSTANTIATE THE CLASS, RUN A CLASS INSTANCE METHOD -----"
factory.new.bark
puts " ----- NOTE THAT A CLASS CAN'T BE DEFINED IN A METHOD -----"



puts "------------------------------------------------------------------------------------------"
########################################
#          INHERITED CALLBACK          #
########################################
puts "***************** INHERITED CALLBACK *****************"
## TODO <<< ACTUALLY FIGURE THIS OUT, TEST IT [[TODO]] -- http://ruby-doc.org/core-1.9.3/Class.html
class Foo
   def self.inherited subclass
      puts "New subclass: #{subclass}"
   end
end



puts "------------------------------------------------------------------------------------------"
########################################
#          ALIAS CLASS METHOD          #
########################################
puts "***************** ALIAS CLASS METHOD *****************"

# TODO
# class TestClass
# 	alias 
# 	def initialize(name='boo')
		
# 	end
# end

#########################################
#          METHOD MANIPULATION          #
#########################################

################################
#          PROPERTIES          #
################################
# puts "\n ----- DEFINE A CLASS WITH PROPERTIES -----"
# class Person
# 	def name= name
# 		@name = name
# 	end
# end

# meeka = Person.new

# meeka.name = "meeka"

# puts meeka['name']




########## CHEATSHEET
# Class instance variables: always have an @ before their name, & are defined
# 													before the 1st def in a class
# Class variables: 					always have an @@ before their name, & are defined before the
# 													1st def in a class
# Instance variables: 			always have an @ before their name, & are defined in
# 													methods of the class or via accessors e.g. attr_accessor
