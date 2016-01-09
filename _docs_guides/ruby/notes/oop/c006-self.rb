#!/usr/local/bin/ruby


puts "------------------------------------------------------------------------------------------"
####################################################
#          SELF IN CLASSES - FOR CHAINING          #
####################################################
puts "***************** SELF IN CLASSES - FOR CHAINING *****************"

puts " ----- DEFINE CLASS THAT RETURNS SELF FROM CONSTRUCTOR & METHODS -----"
class DirInfoDisplay
	attr_accessor :output_string, :headings
	attr_reader :file
	def initialize(filename)
		@file = File.open(filename)
		@output_string = ""
		@headings = []
		self
	end
	def add_heading(heading)
		@headings.push(heading) 
		self
	end
	def prefix_headings(prefix)
		@headings = @headings.map do | heading |
			"#{prefix}#{heading}"
		end
		self
	end
end

puts " ----- INSTANTIATE CLASS THAT RETURNS SELF FROM CONSTRUCTOR & METHODS -----"
dir_info = DirInfoDisplay.new("./test_file.txt")

puts " ----- RUN INSTANCE METHOD MANY X IN 1 LINE W/ CHAINING, BY MAKING USE OF RETURN SELF -----"
# because the method returns the object that contains it, you can just run another method on the
# object in the same chain of function calls
dir_info.add_heading("hello").add_heading("aloha").add_heading("bonjour")
puts dir_info.headings.to_s

puts " ----- RUN 2 DIFFERENT METHODS IN A CHAIN BY MAKING USE OF RETURN SELF -----"
dir_info.add_heading("gutentag").prefix_headings("greeting_")
puts dir_info.headings.to_s

puts " ----- INSTANTIATE CLASS AGAIN, & IMMEDIATELY RUN INSTANCE FN ON SAME LINE W/ CHAINING -----"
dir_info_2 = DirInfoDisplay.new("./test_file.txt").add_heading("size").add_heading("filename")
puts dir_info_2.headings.to_s

puts "------------------------------------------------------------------------------------------"


puts "------------------------------------------------------------------------------------------"
###############################################################
#          SELF FOR USING KEYWORDS AS VARIABLE NAMES          #
###############################################################
puts "***************** SELF FOR USING KEYWORDS AS VARIABLE NAMES *****************"

puts " ----- DEFINE CLASS W/ FUNCTION SHARING A NAME W/ A KEYWORD -----"
class Organism
	attr_accessor :alive
	def initialize(alive = true)
		@alive = alive
	end
	def categorize(new_class, new_kingdom)
		self.class(new_class)
		self.kingdom(new_kingdom)
	end
	def get_categorization
		"Creature is a member of kingdom #{@kingdom} and class #{@class}"
	end
	def class(new_class)
		@class = new_class
	end
	def kingdom(new_kingdom)
		@kingdom = new_kingdom
	end
end

meeka = Organism.new

puts " ----- INSTANTIATE CLASS CONTAINING FUNCTION THAT SHARES ITS NAME WITH A KEYWORD -----"
meeka.categorize("Mammalia", "Animalia")
puts " ----- CALL AN INSTANCE FN THAT USES self TO CALL OWN FN THAT SHARES NAME W A KEYWORD -----"
puts meeka.get_categorization

# Note that if a class calls self it cannot access the class' private methods


puts "------------------------------------------------------------------------------------------"
############################################################################
#          SELF FOR CALLING BUILT-IN CLASSES NAMED AFTER KEYWORDS          #
############################################################################

# For example, if an instance method needs to reference what class it is part of it, it must call
# a built-in method called 'class'. To call this function from within the class, you have to call
# self.class - you cannot simply call class (Ruby will not know if you are trying to run the 
# method named class, or if you are trying to define a new class. self.class makes it explicit)

puts "***************** SELF FOR CALLING BUILT-IN CLASSES NAMED AFTER KEYWORDS *****************"

puts " ----- DEFINE A CLASS THAT NEEDS TO REFERENCE ITS OWN CLASS -----"
class SelfKnowledge
	def initialize(name = "UNNNAMED")
		puts "Self-referencing class initialized!"
		@name = name
	end
	def metadata
		"NAME: #{@name}; CLASS: #{self.class}"
	end
end

puts " ----- INSTANTIATE SELF-REFERENCING CLASS -----"
self_ref = SelfKnowledge.new("Dalai Lama")

puts " ----- CALL INSTANCE METHOD THAT GETS INSTANCE'S CLASS NAME (self NEEDED TO REF class) -----"
puts self_ref.metadata



puts "------------------------------------------------------------------------------------------"
#####################################################
#          SELF FOR DEFINING CLASS METHODS          #
#####################################################
puts "***************** SELF FOR DEFINING CLASS METHODS *****************"

puts " ----- DEFINE CLASS WITH CLASS METHODS - AN ALIAS FOR new, & A SPECIAL FACTORY METHOD -----"
class Time
	def self.right_now
		new # => this does the same as what calling Time.new or self.new would do at this location
	end
	def self.yesterday
		right_now - 24 * 60 * 60
	end
end

puts " ----- INSTANTIATE Time W A CLASS FACTORY METHOD (DEF ON CLASS W def self.method_name) -----"
puts Time.yesterday

puts " ----- INSTANTIATE Time W A CLASS METHOD ACTING AS AN ALIAS FOR NEW -----"
puts Time.right_now
