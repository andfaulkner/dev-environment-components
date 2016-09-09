########################################################################
######################## HOW RUBY DSLs ARE MADE ########################
########################################################################


puts "------------------------------------------------------------------------------------------"
#####################################################
#          CONTEXT OF A DSL - JUST A CLASS          #
#####################################################
puts "***************** CONTEXT OF A DSL - JUST A CLASS *****************"

class Project
	NULL = Object.new.freeze

	def initialize val = NULL
		if val.equal?(NULL)
			@name
		else
			@name = sanitize val
		end
	end

	private

	def sanitize str
		str.gsub(/\s+/, '-').downcase
	end
end

# 	NULL value
# 			*   create a new, frozen value to represent nil.
# 			*   if you don't and instead use the default value of nil, it will prevent users from
# 					setting the value of something to nil, since as it'll make instance_eval assume
# 					literally nothing was passed 

#   Overloading
#   		*   e.g. name item above. When given no params, initialize returns instance variable @name;
#   						 when given a valuem the method passes it to sanitize & returns a sanitized result

#   sanitize method
#   		*   replace all spaces with dashes <<< WILL EXPLAIN LATER


puts "------------------------------------------------------------------------------------------"
###################################
#          LOADING A DSL          #
###################################
puts "***************** LOADING A DSL *****************"

puts " ----- *** Define a DSL loader file to load the DSL library & pass in \"DSL code\" *** -----"

puts " ----- Load the language definition in the DSL loader -----"
path = './DSL_files/tDSL_01_project--dsl_definition.rb'
contents = File.read(path)

puts " ----- Instantiate the DSL library / definition -----"
project = Project.new

puts " ----- Grab code -----"
project.instance_eval(contents, File.basename(path), 0)
project


puts "------------------------------------------------------------------------------------------"
###################################
#          instance_eval          #
###################################
puts "***************** instance_eval *****************"

#   Less dangerous than eval
#   Evaluate a string in the context of a parent function

## 


puts "------------------------------------------------------------------------------------------"
###########################################
#          THE CLEANROOM PATTERN          #
###########################################
puts "***************** THE CLEANROOM PATTERN *****************"
# https://sethvargo.com/the-cleanroom-pattern/



puts "------------------------------------------------------------------------------------------"
###############################################
#          MAKING RUBY DSLs - BASICS          #
###############################################
puts "***************** MAKING RUBY DSLs - BASICS *****************"

