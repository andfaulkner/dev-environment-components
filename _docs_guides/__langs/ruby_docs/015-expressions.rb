
#examples for usage
class Bear
	attr_accessor :name
	attr_reader :type

	def initialize(name, type='grizzly')
		@name = name
		@type = type
	end

	def roar
		p 'gr arg'
	end

end

meeka_bear = Bear.new('meeka', 'brown')
meeka_bear.roar

puts "------------------------------------------------------------------------------------------"
#################################
#          EXPRESSIONS          #
#################################
puts "***************** EXPRESSIONS *****************"
#   Expression: any statement that returns an expression
#   anything that can reasonably return a value does in Ruby
#   Thus, almost everything is an expression in Ruby


puts "------------------------------------------------------------------------------------------"
################################################
#          CHAINING USING EXPRESSIONS          #
################################################
puts "***************** CHAINING USING EXPRESSIONS *****************"
puts " ----- Assignment actually returns the value that gets assigned -----"
puts a = b = c = 4		#=> 4     <<< this assignment actually returns a 0
puts b 								#=> 4			<<< but the values still get assigned

puts " ----- Chaining methods from an array to repeatedly alter the array -----"
[ 3, 1, 7, 0 ].sort.reverse 	#=> [ 7, 3, 1, 0 ]


puts "------------------------------------------------------------------------------------------"
############################################################
#          UNEXPECTED THINGS THAT ARE EXPRESSIONS          #
############################################################
puts "***************** UNEXPECTED THINGS THAT ARE EXPRESSIONS *****************"
puts " ----- p statements are expressions -----"
str = p 'grrrrrr' 	# => grrrrrr
p str 							# => grrrrrr

puts " ----- if statements are expressions -----"
did_meeka_roar = if meeka_bear.roar == 'gr arg'
	'meeka roared!'
end

puts did_meeka_roar # => 'meeka roared!'

