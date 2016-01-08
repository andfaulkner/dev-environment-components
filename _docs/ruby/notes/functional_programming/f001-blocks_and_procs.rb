#!/usr/local/bin/ruby

# 
# Blocks: code wrapped in a do-end construct
# 

myarray = %w{one two three four}

puts myarray


puts "------------------------------------------------------------------------------------------"
############################
#          BLOCKS          #
############################
#
# AMPERSAND PARAMETERS - e.g. def some_method(&this_is_a_block)
# 	-   these represent blocks that can be passed in to a method
#
# name_of_block.call - does the same thing as yield, but you have the name of the block visible
puts "***************** BLOCKS *****************"

puts " ----- PASS A BLOCK TO AN EACH METHOD AS A PARAM (IN THE STANDARD WAY) -----"
myarray.each { |item| print "ITEM: " + item + ". " } # <<-between the curly braces is the block

puts " ----- CREATE METHOD THAT CHECKS IF A BLOCK WAS PASSED IN -----"
def hello(&block)
	if block_given?
		block.call
		puts "a block was received!"
	else
		puts "no block was received :("
	end
end

puts " ----- RUN METHOD WITH BLOCK PASSED IN -----"
hello { puts "hello!" }
puts " ----- RUN METHOD WITH NO BLOCK PASSED IN -----"
hello

puts " ----- CREATE METHOD THAT TAKES AN AMPERSAND PARAM AND ANOTHER PARAM -----"
def hello_again(name, &my_block)
	my_block.call if block_given? # <<< this check is NB, w/out it an err throws if no block given
	puts "hello #{name}!"
end

puts " ----- CALL METHOD THAT TAKES AN AMPERSAND PARAM AND ANOTHER PARAM, WITH A BLOCK -----"
hello_again("meeka") { puts "I am a block!" }
puts " ----- CALL METHOD THAT TAKES AN AMPERSAND PARAM AND ANOTHER PARAM, WITH NO BLOCK -----"
hello_again("meeka")

puts "------------------------------------------------------------------------------------------"
###########################
#          PROCS          #
###########################
puts "***************** PROCS *****************"
#
# Procs: Sort of like blocks stored in a variable. They are objects that store an
# 				executable chunk of code. Procs are instances of the Proc class.
# 				They're not EXACTLY like blocks, but the differences are subtle.
# 

puts " ----- CREATE A PROC THAT TAKES ONE ARGUMENT -----"
myproc = Proc.new {|animal| puts "I love #{animal}"}

puts " ----- CALL A PROC, WITH AN ARGUMENT -----"
myproc.call("pandas")

puts " ----- PUT A PROC IN A BLOCK AND RUN EACH ITEM IN AN ARRAY THROUGH IT -----"
myarray.each { | item | myproc.call(item) }


puts "------------------------------------------------------------------------------------------"
#############################
#          LAMBDAS          #
#############################
#
# Lambdas: similar to Procs. Also similar to JS' lambdas. Creating a proc w/ the lambda 
# 				 keyword does almost the same thing as Proc.new, w/ a few minor differences:
# 				 	1) lambda is stricter - you must call a lambda w/ the right # of args. Proc.new
# 				 	   lets you call the proc with too many args without complaining.
# 				 	2) When returning a value, lambda objects don't affect the flow of the application,
# 				 	   whereas objects created with Proc.new will exit their enclosing method on return.
# 				 	   I.E. return in a Proc returns 2 levels up; return in a λ only returns from the λ.
# 				 	
# 

puts "***************** LAMBDAS *****************"

puts " ----- CREATE A LAMBDA THAT TAKES ONE ARGUMENT -----"
mylambda = lambda {|x| puts "Argument received by lambda: #{x}" }

puts " ----- CALL A LAMBDA WITH ONE ARGUMENT -----"
mylambda.call("PAAAANDAS!")


puts "------------------------------------------------------------------------------------------"
###########################################################
#          YIELD & BLOCK / PROC / LAMBDA PASSING          #
###########################################################
puts "***************** YIELD & BLOCK / PROC / LAMBDA PASSING *****************"
#
# yield basically acts as an insertion point for a passed-in block. The passed-in block
# runs when yield is hit
# 

puts " ----- DEFINE A METHOD THAT CONTAINS A YIELD -----"
def yieldme
	print "1.Enter method. "
	yield
	puts " 3.Exit method. "
end

puts " ----- CALL YIELD-CONTAINING FUNCTION WITHOUT PASSING IN A BLOCK -----"
# yieldme { print "2. In block." } # => no block given (yield) (LocalJumpError)

puts " ----- CALL YIELD-CONTAINING FUNCTION WITH A BLOCK PASSED IN -----"
yieldme { print "2.In block." }	# => 1.Enter method. 2.In block. 3.Exit method

puts " ----- CALL YIELD-CONTAINING FUNCTION WITH A DIFFERENT BLOCK PASSED IN -----"
yieldme { print "2.In different block." } # => 1.Enter method. 2.In different block. 3.Exit method

def sum_3_nums(num1, num2, num3)
	# puts self.methods.sort
	puts __method__
 	num1 + num2 + num3
end

sum_3_nums(3, 4, 2)