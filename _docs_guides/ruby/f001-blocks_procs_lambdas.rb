#!/usr/local/bin/ruby

require 'pry'

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
###########################################################################
#          DEFINE BLOCK MANUALLY BY EXTRACTING METHOD FROM CLASS          #
###########################################################################
# Don't do this, it's purely academic
puts "***************** DEFINE BLOCK MANUALLY BY EXTRACTING METHOD FROM CLASS *****************"

puts " ----- DEFINE A CLASS WITH AN EXTRACTABLE METHOD -----"
class Dog

	def initialize(bark_noise='woof')
		@bark_noise = bark_noise
	end

	def bark(noise=false)
		if noise
			p noise
		elsif @bark_noise
			p @bark_noise
		else
			p 'woof!'
		end
	end

	def lick
		p 'lick lick lick'
	end
end

puts " ----- GET THE METHOD OUT OF A TEMPORARY INSTANCE OF THE CLASS -----"
bark_method = Dog.new().method('bark')

puts " ----- CONVERT THE METHOD TO A PROC TO RUN IT -----"
bark = bark_method.to_proc

puts " ----- RUN THE METHOD OUTSIDE THE BOUNDS OF THE CLASS -----"
bark.call # => "woof"


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
# Note that yield is NOT a method. It's a keyword saying to run the block - yield itself is nothing
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


puts " ----- USE YIELD IN A FUNCTION (METHOD) WITH NO PARAMS AT ALL, BUT A YIELD INSIDE  -----"
def stuff
	p "about to do stuff!"
	yield
end

puts " ----- CALL FUNCTION THAT TAKES NO PARAMS WITH A BLOCK -----"
stuff { puts "did stuff!" }


puts " ----- EMBED A CALL TO YIELD IN A STRING -----"
def hello_to_block
	"The block passed in wants to say...#{yield}!"
end

p hello_to_block { 'aloha mateys'} 		# => "The block passed in wants to say...aloha mateys!"

puts "------------------------------------------------------------------------------------------"
############################################################################
#          CHECK THAT BLOCK WAS GIVEN WHEN REQUIRED BY A FUNCTION            #
############################################################################
puts "***************** CHECK THAT BLOCK WAS GIVEN WHEN REQUIRED BY A FUNCTION   *****************"

puts " ----- CREATE A FUNCTION DEFINING A CHECK FOR A BLOCK: block_given? -----"
def grarg
	yield if block_given?
	else p "no block given :("
end

puts " ----- RUN THE YIELDING FUNCTION WHEN NO BLOCK IS GIVEN -----"
grarg # => "no block given :("

puts " ----- RUN THE YIELDING FUNCTION WITH A BLOCK -----"
grarg { puts "hello I'm a block!" } # => hello I'm a block!


puts "------------------------------------------------------------------------------------------"
#############################################################################
#          EXPLICIT BLOCKS (BLOCKS ACCESSIBLE TO RECEIVING METHOD)          #
#############################################################################
# corollary: implicit blocks. All we've used previously.
# No access to their object, runnable only via yield
puts "***************** EXPLICIT BLOCKS (BLOCKS ACCESSIBLE TO RECEIVING METHOD) *****************"

puts " ----- DEFINE A METHOD WITH AN &param_name BLOCK-ACCEPTING PARAMETER -----"
def calculation(a, b, &block)
	puts 'running calculation!'
	block.call(a, b)
end

puts " ----- CALL THE METHOD WITH REGULAR PARAMS AND A BLOCK -----"
puts calculation(4, 7) {|num1, num2| num1 + num2}
# => running calculation!
# 	 11


puts "------------------------------------------------------------------------------------------"
################################
#          YIELD SELF          #
################################
# Makes an instance available to a block passed to one of the instance's methods. I.e.
#                                  
#                                       ==================================
# (-(passed to instance method)-)       ||  INSTANCE                    ||
# (        _________________    )       ||    _______________________   ||
# ( args, |  BLOCK          |   )---1---++-->|      instance_method1 |  ||
# (				|  |--4-->{[A]}   |   )       ||   | [mtd code runs]<--2-| |  ||
# (				|  |              |<--)---3---++---+----3--(INSTANCE)--3-/ |  ||
# (				|	 |			 	   	  |   )       ||   |_______________________|  ||
# (       |  |              |   )       ||                              ||
# (       |  |              |   )       ||    _______________________   ||
# (       |  \->[INSTANCE]--+---)---5---++-->| instance_method2      |  ||
# (       |_________________|   )       ||   |_______________________|  ||
# (                             )       ==================================
# (-----------------------------)    
#
# 1: arguments and a block are passed to an instance method in an instance
# 2: the instance method code runs
# 3: yield self is called in the instance method, passing the instance to the block
# 4: the block code is executed
# 5: another instance method is called, which is available because it was passed into the block
#    as self
#
#
# {[A]} -  block code runs
puts "***************** YIELD SELF *****************"
puts " ----- Define a test class -----"
class YieldsToSelf
	def initialize
		puts "YieldsToSelf initializing!"
		yield self if block_given?
	end

	def hello_im_yields_to_self
		"Hello! I'm in a method in an instance of class YieldsToSelf! YAY!"
	end

	def too_tired_error msg = "this shit"
		puts "I'm too tired for #{msg}"
	end

	def too_boring_error msg = "This shit"
		puts "#{msg} is too boring, not doing it"
	end

	def runme *args
		@current_args = args
		yield self if block_given?
	end

end

yieldsToSelf = YieldsToSelf.new {|s|
	puts s.hello_im_yields_to_self
} # => "Hello! I'm in a method in an instance of class YieldsToSelf! YAY!"

puts yieldsToSelf.hello_im_yields_to_self
# => "Hello! I'm in a method in an instance of class YieldsToSelf! YAY!"

puts " ----- CALL A 'RUNNER' METHOD IN YieldsToSelf WITH A BLOCK GIVEN self THAT REFERENCES"
puts " ----- ALL ARGS PASSED TO THE ORIGINAL METHOD -----"
yieldsToSelf.runme(6) {|es|
	args = es.instance_variable_get(:@current_args)
	puts "args given to original object: #{args}"
	if args.count > 4
		es.too_tired_error "handling that many arguments, #{args.count} is way too much, you crazy."
	end
}

puts "end" 


puts "------------------------------------------------------------------------------------------"
###############################
#          RECURSION          #
###############################
puts "***************** RECURSION *****************"

puts " ----- EXAMPLE -----"

def select_redis_port
  counter = 1
  get_port = ->{
  	puts "What port would you like to assign to redis?"
    port = $stdin.gets.to_i
    if port < 1
      return 6379 if counter >= 3
      puts "invalid port - please input an integer above 0"
      counter = counter + 1
      return get_port.call
    end
    port
  }
  get_port.call
end

# asks user to input an int 3 times. if the user fails to do this all 3 times, returns 6379
select_redis_port
