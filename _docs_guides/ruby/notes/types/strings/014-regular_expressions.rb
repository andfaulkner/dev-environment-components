#!/usr/local/bin/ruby
test_string = "Here is a string. It is quite silly."

puts "------------------------------------------------------------------------------------------"
###############################################
#          BASIC REGULAR EXPRESSIONS          #
###############################################
puts "***************** BASIC REGULAR EXPRESSIONS *****************"

puts " ----- RETURN FIRST MATCHING SUBSTRING -----"
# first method
first_match = /[^\.]*[\.]/.match(test_string)
puts first_match	# => Here is a string
# second method
first_match_method_2 = test_string.scan(/[^\.]*[\.]/).first
puts "#{first_match_method_2}"	# => Here is a string.

puts " ----- MATCH STARTING FROM A CERTAIN POSITION IN THE STRING BEING SEARCHED -----"
match_after_3rd_char = /[^\.]*[\.]/.match(test_string, 2) # start at position 2 (the third char)
puts match_after_3rd_char # => re is a string.

puts " ----- RETURN LAST MATCHING SUBSTRING -----"
last_match = test_string.scan(/[^\.]*[\.]/).last
puts "|#{last_match}"	# => | It is quite silly.

puts "------------------------------------------------------------------------------------------"
################################################
#          REGULAR EXPRESSION OBJECTS          #
################################################
puts "***************** REGULAR EXPRESSION OBJECTS *****************"
puts " ----- CREATE A REGULAR EXPRESSION OBJECT -----"
my_regex = /[^\.]*[\.]/
# my_regex = /[a-zA-Z]+/

puts " ----- RETURN ALL SUBSTRINGS MATCHING REGULAR EXPRESSION IN OBJECT -----"
my_string = test_string
puts my_string.scan(my_regex).to_s		# => ["Here is a string.", " It is quite silly."]

puts " ----- RETURN ALL MATCHING SUBSTRINGS -----"
puts test_string.match(/[^\.]*[\.]/)