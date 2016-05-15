#!/usr/bin/env ruby


puts "------------------------------------------------------------------------------------------"
#############################################################################
#          Remove stupid duplication on data-only classes w Struct          #
#############################################################################
puts "***************** Remove stupid duplication on data-only classes w Struct *****************"

point = Struct.new(:x, :y)
puts point # => #<Class:0x007ffb502422c0>  <<< yep, structs are classes

puts point.name  # => nil                  <<< not instantiated yet!

Point = point    #                         <<< ACTUALLY INSTANTIATED NOW
puts point 			 # => point                <<< craziness, point now exists 
puts point.class # => Class

l_one = Point.new(10, 12)

puts l_one 				 # => #<struct Point x=10, y=12>
puts l_one.x 			 # => 10
puts l_one.y 			 # => 12


puts "------------------------------------------------------------------------------------------"
################################################
#          DYNAMICALLY CHANGE STRUCTS          #
################################################
puts "***************** DYNAMICALLY CHANGE STRUCTS *****************"

l_one[:x] = 14
 puts l_one.x 		# => 14



puts "------------------------------------------------------------------------------------------"
##################################################
#          EQUALITY ON STRUCTS IS FREE!          #
##################################################
puts "***************** EQUALITY ON STRUCTS IS FREE! *****************"

puts l_one === Point.new(14, 12) # => true    <<< equal if the attributes are the same

 

 puts "------------------------------------------------------------------------------------------"
 ###########################################################################
 #          GET NAMES OF ALL STRUCT ATTRIBUTES, ITERATE OVER THEM          #
 ###########################################################################
 puts "***************** GET NAMES OF ALL STRUCT ATTRIBUTES, ITERATE OVER THEM *****************"
 
puts " ----- GET STRUCT ATTRIBUTES WITH member -----"
puts l_one.members
# => x
# => y

puts " ----- ITERATE OVER STRUCT ATTRIBUTE VALUES WITH each -----"
l_one.each {|attr| puts attr}
# => 14
# => 12

puts " ----- ITERATE OVER STRUCT KEYS & VALUES WITH each_pair -----"
l_one.each_pair {|key, value| puts "#{key}: #{value}"}
# => x: 14
# => y: 12


puts "------------------------------------------------------------------------------------------"
###############################################
#          STRUCT ENUMERABLE METHODS          #
###############################################
puts "***************** STRUCT ENUMERABLE METHODS *****************"

puts " ----- GET MAX STRUCT VALUE -----"
puts l_one.max # => 14

puts " ----- GET MIN STRUCT VALUE -----"
puts l_one.min # => 12

puts " ----- DO REDUCE ON STRUCT -----"
puts l_one.reduce(&:+) # => 26


puts "------------------------------------------------------------------------------------------"
######################################################
#          CREATE STRUCT THAT TAKES A BLOCK          #
######################################################
puts "***************** CREATE STRUCT THAT TAKES A BLOCK *****************"

PointTwo = Struct.new(:x, :y) do
	def to_s
		"(#{x}x#{y})"
	end
end

pt_two = PointTwo.new(4, 1)
puts pt_two # => 4x1