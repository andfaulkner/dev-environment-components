#!/usr/bin/ruby

##############################
# CHECK START AND END VALUES #
##############################

puts "\n------ DETERMINE IF STRING STARTS WITH GIVEN SEQUENCE ------"
puts "hello".start_with?("hell")

puts "\n------ DETERMINE IF STRING ENDS WITH GIVEN SEQUENCE ------"
puts "hello world".end_with?("world")


puts "------------------------------------------------------------------------------------------"
#####################################
#          SEARCH A STRING          #
#####################################
puts "***************** SEARCH A STRING *****************"
puts " ----- DETERMINE IF A STRING CONTAINS A GIVEN STRING -----"
p "Hello muffins!".include?("muffins") 		#=> true
p "Hello muffins!".include?("bagels") 		#=> false

puts " ----- FIND A SUBSTRING AND RETURN THE FIRST OCCURRENCE OF IT -----"
puts " ----- RETURN IT AS A MatchData OBJECT: -----"
p 'Meeka is a big ball of fluff'.match(/....ball/) # => #<MatchData "big ball">
# MatchData has its own set of methods that you can run on it

puts " ----- NOTE THE INSTANCE METHODS ON THE MatchData OBJECT RETURNED -----"
p 'Meeka is a big ball of fluff'.match(/....ball/).class.instance_methods(false).sort

puts " ----- RETURN THE FIRST OCCURENCE OF THE SUBSTRING AS A String OBJECT: -----"
p 'Meeka is a big ball of fluff'.match(/....ball/).to_s # => "big ball"

puts " ----- RETURN THE FIRST OCCURENCE OF A SUBSTRING APPEARING AFTER A CERTAIN GIVEN INDEX -----"
p 'Meeka is a big ball of fluff, and plays with her ball'.match(/....ball/, 40).to_s #=> "her ball"

puts "------------------------------------------------------------------------------------------"
##################################################
#          GET STRING INDEXES / INDICES          #
##################################################
puts "***************** GET STRING INDEXES / INDICES *****************"

puts " ----- GET THE INDEX OF THE LAST OCCURRENCE OF A GIVEN CHARACTER OR SUBSTRING  -----"
p "Hello toast!".rindex('e') # => 1
p "Hello toast!".rindex('t') # => 10
p "Hello toast!".rindex('toast') # => 6

puts " ----- GET THE INDEX OF THE FIRST OCCURRENCE OF A GIVEN CHARACTER OR SUBSTRING  -----"
p "Hello toast!".index('t') # => 6
