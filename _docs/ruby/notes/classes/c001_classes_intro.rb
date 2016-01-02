#!/usr/bin/ruby

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
###################################
#          CLASS METHODS          #
###################################
puts " ************** DECLARE A CLASS WITH A METHOD **************"
class PersonWithAMethod
	def declare_personhood
		"I am a person"
	end
	def say_hello_to_someone(name)
		"hello #{name}!"
	end
	def say_hello_to_johnny_or_someone(name = "johnny")
		"hello #{name}!"
	end
end

puts " ------ INSTANTIATE CLASS WITH METHOD ------"
person_with_one_method = PersonWithAMethod.new

puts " ------ CALL METHOD ON INSTANTIATED CLASS ------"
puts person_with_one_method.declare_personhood # => I am a person

puts " ------ CALL METHOD ON INSTANTIATED CLASS WITH PARAM GIVEN ------"
puts person_with_one_method.say_hello_to_someone("moomler") # => hello moomler!

puts " ------ CALL METHOD WITH DEFAULT PARAM ON INSTANTIATED CLASS, NO PARAM GIVEN ------"
puts person_with_one_method.say_hello_to_johnny_or_someone # => hello johnny!

puts " ------ CALL METHOD WITH DEFAULT PARAM ON INSTANTIATED CLASS, WITH PARAM GIVEN ------"
puts person_with_one_method.say_hello_to_johnny_or_someone("moomroom") # => hello moomroom!

# default values for each param can be given

puts "------------------------------------------------------------------------------------------"
#######################################################
#          'INITIALIZE' METHOD (CONSTRUCTOR)          #
#######################################################
# method named initialize is special - it runs when new is invoked
puts " ************************** INITIALIZE METHOD (CONSTRUCTOR) **************************"

puts " ************** DEFINE A CLASS WITH A CONSTRUCTOR **************"
class PersonWithConstructor
	def initialize(name = "\[NoName\]")	# Note the default value (Not required)
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
meeka = PersonWithConstructor.new("meeka")
puts meeka.say_hi # => meeka says hi!

puts " ----- GET INSTANCE METHODS A CLASS HAS -----"
puts PersonWithConstructor.instance_methods(false)

puts "------------------------------------------------------------------------------------------"
############################################
#          PROPERTIES & ACCESSORS          #
############################################
puts " ************************** PROPERTIES AND ACCESSORS **************************"

# properties can't be accessed directly
# e.g. meeka.@name <-- no dice

puts " ----- GET INSTANCE VARIABLE DIRECTLY WITH instance_variable_get -----"
puts meeka.instance_variable_get("@name") # => meeka

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
	def initialize(name = "\[DEFAULT\]")
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
	def initialize(name = "\[DEFAULT\]")
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
	def initialize(name = "\[DEFAULT\]", age = 20)
		@name = name
		@age = age
		@time_created = Time.now
	end
end

puts " ----- INSTANTIATE CLASS WITH MULTIPLE ACCESSORS, OUTPUT DATA FROM READ-ONLY ACCESSORS -----"
person_w_3_read_accessors = PersonWithThreeReadOnlyAccessors.new("moomarooma", 25)
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
	def initialize(name = "\[DEFAULT\]")
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
	def initialize(name)
		@@latest = name
	end
end

puts " ----- 1: INSTANTIATE ONCE THEN OUTPUT CLASS-LEVEL VARIABLE FROM THE CLASS OBJECT -----"
jacky_o_hare = PersonWithClassLevelVariable.new('jacky o hare')
puts PersonWithClassLevelVariable.get_latest

puts " ----- 2: INSTANTIATE THEN OUTPUT CLASS-LEVEL VARIABLE FROM THE CLASS OBJECT AGAIN -----"
johnny_d = PersonWithClassLevelVariable.new('johnny d')
puts PersonWithClassLevelVariable.get_latest

puts " ----- GET CLASS LEVEL VARIABLE VALUE FROM AN INSTANCE OF THE CLASS -----"
johnny_d.class::get_latest

puts "------------------------------------------------------------------------------------------"

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
