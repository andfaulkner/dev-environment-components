
puts "------------------------------------------------------------------------------------------"
####################################################################################
#          METHODS CAN'T BE DECLARED WITH self.method_name (DOT NOTATION)          #
####################################################################################
puts "***************** METHODS NOT DECLARABLE W self.method_name (DOT NOTATION) *****************"
#  e.g. self.foo = "value of foo"   # DOES NOT WORK

puts " ----- DECLARE NEW INSTANCE METHODS W GETTERS & SETTERS & CHANGE FROM OUTSIDE INSTEAD -----"
class ChiaPet
	attr_accessor :title
end

item = ChiaPet.new
item.title = "Ch-ch-ch-chia pet!"
p item.title



puts "------------------------------------------------------------------------------------------"
#################################################################################
#          INSTANCE VARIABLES WORK @ THE CLASS LVL NOT JUST IN METHODS          #
#################################################################################
puts "***************** INSTANCE VARIABLES WORK @ CLASS LVL, NOT JUST IN METHODS *****************"

class MonoMonoMonoMonoMono
	@wtf_is_this = "polyfilla, apparently"
	def self.wtf_is_this
		@wtf_is_this
	end
end

puts MonoMonoMonoMonoMono.wtf_is_this 				# =>  "polyfilla, apparently"
puts MonoMonoMonoMonoMono.send("wtf_is_this") # =>  "polyfilla, apparently"


puts "------------------------------------------------------------------------------------------"
##############################################################################
#          DON'T USE OUT-OF-def @@value CLASS VARIABLE DECLARATIONS          #
##############################################################################
puts "***************** DON'T USE OUT-OF-def @@value CLASS VARIABLE DECLARATIONS *****************"
puts " ----- They overwrite parent vals in ANY class they extend. -----"
class Parent
	@@value = 1
  def self.value
    @@value
  end
end

class Child < Parent
  @@value = 2
end

puts Parent.value #=> 2 << Child overwrote @@value. If you didn't make Child, you have no idea why.

puts " ----- All classes extend Object, so they can even overwrite global methods. Dangerous -----"
# monkey patch on Object, as commonly used by Rails
puts " ----- Reopen Object to add new method app_type, & monkeypatch overriding def methods -----"
puts " ----- NOTE: this is stupid unless you're making a DSL (such as Rails) -----"
class Object
	@@methods = self.methods
	@@app_type = "Rails"
  def self.methods
  	puts "call made to get methods on class Object"
    @@methods 
  end
  def self.app_type
  	@@app_type
  end
end

puts " ----- EVIL::: Create class w a class var overloading a global method name ('methods') -----"
class Stupid < Object
	@@app_type = "derp"
	@@methods = "I\'m a moron because I did this"
end

puts " ----- Calling Object.methods ANYWHERE now returns the value of our class var. BAD. -----"
puts Object.app_type # => derp
puts Object.methods # => I'm a moron
puts " ----- This is unpredictable, confusing, and near impossible to debug -----"

#################################### MODULE GOTCHAS ####################################

#   *   If a module is included twice, the second inclusion is ignored

#   *   If two modules define the same method, the second one to be included is used

#   *   Module methods cannot replace methods already defined in a class



puts "------------------------------------------------------------------------------------------"
###################################
#          BLOCK GOTCHAS          #
###################################
puts "***************** BLOCK GOTCHAS *****************"
puts " ----- Blocks can't be directly stored in variables. Wrap them in a lambda or proc 1st -----"

puts " ----- Define a proc containing a block that gives you the current time -----"
time_proc = proc { Time.now }

puts " ----- Call the proc with proc_name_here.call -----"
puts time_proc.call	# => 2016-04-12 17:10:38 -0400    <<< gives current time, so changes every call

puts " ----- Define a proc containing a block that adds 2 numbers, requiring 2 parameters -----"
add_two_numbers = proc {|num1, num2| num1 + num2 }

puts " ----- Call the add_two_numbers proc with parameters given -----"
puts add_two_numbers.call(5, 7)	# => 12

puts " ----- Define a lambda containing a block that gives you the current time -----"
time_lambda = lambda { Time.now }

puts " ----- Call the lambda with lambda_name_here.call -----"
puts time_lambda.call

puts " ----- MAJOR GOTCHA: lambda & proc aren't identical: they treat return differently -----"
puts " ----- lambda: return from the lambda. Proc: return from context proc was called in -----"
puts " ----- SOLUTION: AVOID EXPLICIT RETURNS FROM BLOCKS -----"
