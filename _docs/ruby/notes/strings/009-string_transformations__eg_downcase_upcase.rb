#!/usr/bin/ruby
puts "------------------------------------------------------------------------------------------"
####################################
#          CAPITALIZATION          #
####################################
puts "***************** CAPITALIZATION *****************"

# puts ENV.inspect
puts "------ MAKE AN ENTIRE STRING LOWERCASE ------"
puts "STRING".downcase 		# => string

puts "------ MAKE AN ENTIRE STRING UPPERCASE ------"
puts "string".upcase 			# => STRING

puts "------ CAPITALIZE A STRING ------"
puts "string".capitalize 			# => String

puts "------ CAPITALIZE A STRING, return nil if no changes made ------"
puts "String".capitalize! 			# => 
puts "string".capitalize! 			# => 

puts "------------------------------------------------------------------------------------------"
#######################
# 		  DEDUPE  			#
#######################
puts "***************** DEDUPE *****************"

puts "------ REMOVE ALL DOUBLE CHARACTER SEQUENCES ------"
puts "aasdff asdf".squeeze	# => asdf asdf

puts "------ REMOVE ALL DOUBLE CHARACTER SEQUENCES CONTAINING GIVEN RANGE OF CHARACTERS ------"
puts "aasdff asdf".squeeze("a-e")	# => asdff asdf  (f is outside the range being 'squeezed')

puts "------------------------------------------------------------------------------------------"
###############################
# 			 TRIM & CHOMP 			  #
###############################
puts "***************** TRIM & CHOMP (REMOVE WHITESPACE & NEWLINES) *****************"

puts "------ REMOVE LEADING AND TRAILING WHITESPACE WITH .strip ------"
puts "    asdf    ".strip # => asdf

puts "------ REMOVE LEADING & TRAILING WHITESPACE, RETURN NIL IF NO CHANGE ------"
puts "asdf".strip! # => 
puts "    asdf    ".strip! # => asdf

puts "------ REMOVE TRAILING NEWLINE CHARACTERS ------"
puts "my string\n\n".chomp # => my string

puts "------------------------------------------------------------------------------------------"
####################################################
#          REPLACE CHARACTERS IN A STRING          #
####################################################
puts "***************** REPLACE CHARACTERS IN A STRING *****************"

puts "------ REPLACE 1ST MATCHING SUBSTRING W/ STR OF SAME LENGTH AS SUBSTRING ------"
puts "string".sub("str", "yay") # => yaying

puts "------ REPLACE 1ST MATCHING SUBSTRING W/ STR OF DIFFERENT LENGTH FROM SUBSTRING ------"
puts "string".sub("str", "yayyay!") # => yayyay!ing

puts "------ REPLACE ALL SUBSTRINGS MATCHING A REGULAR EXPRESSION ------"
puts "string me along".gsub(/\sme\s/, " you ") # => string you along
puts "string me along".gsub(/\s/, "_") # => string_me_along

puts "------ REPLACE INDIVIDUAL CHARACTERS ------"
puts "string me along".gsub(/\s/, "_") # => string_me_along


puts "------------------------------------------------------------------------------------------"
##############################################################
#          SUCCESSORS (GENERATE NEXT IN A 'SERIES')          #
##############################################################
puts "***************** SUCCESSORS (GENERATE NEXT IN A 'SERIES') *****************"
puts " ----- GENERATE SUCCESSOR TO A REGULAR STRING -----"
puts "string".succ # => strinh

puts " ----- GENERATE SUCCESSOR TO A STRING ENDING IN A NUMBER -----"
puts "string3".succ # => string4

puts " ----- GENERATE SUCCESSOR TO A NUMBER -----"
puts 5.succ # => 6

puts " ----- GENERATE SUCCESSOR TO A NUMBER IN STRING FORM -----"
puts "5".succ # => 6

puts " ----- GENERATE SUCCESSOR TO A STRING CONTAINING A NUMBER -----"
puts "<a id=\"5\">".succ # => <a id="6">

puts " ----- GENERATE SUCCESSOR TO A STRING CONTAINING MULTIPLE NUMBERS -----"
puts "<a class=\"7\" id=\"5\">".succ # => <a class="7" id="6">   # ONLY INCREMENTS THE LAST NUMBER


puts "------------------------------------------------------------------------------------------"
################################
#          FORMATTING          #
################################
puts "***************** FORMATTING *****************"

puts " ----- CENTER A STRING -----"
puts "|#{"hello".center(20)}|" 	# => |       hello        |   # pipes added to indicate edge

puts " ----- LEFT PAD A STRING -----"
puts "|#{"hello".ljust(20)}|" 	# => |hello               |

puts " ----- RIGHT PAD A STRING -----"
puts "|#{"hello".rjust(20)}|" 	# => |               hello|


puts "------------------------------------------------------------------------------------------"
#############################################
#          SPLIT STRING INTO ARRAY          #
#############################################
puts "***************** SPLIT STRING INTO ARRAY *****************"

puts " ----- SPLIT INTO WORDS - i.e. BASED ON WHITESPACE (DEFAULT) -----"
puts " now's the   time! YEEEEAAH!".split.to_s 			# => ["now's", "the", "time!", "YEEEEAAH!"]

puts " ----- SPLIT ON MATCHING STRING -----"
puts "WTF? A BEAR? A GRIZZLY BEAR?".split("?").to_s # => ["WTF", " A BEAR", " A GRIZZLY BEAR"]

puts " ----- SPLIT ON MATCHING PATTERN -----"
bear_string = "WTF?!?!?!? A BEAR? A GRIZZLY BEAR?"
bear_match_pattern = /(?<=[a-zA-Z0-9])[!\?]+\s*/ # regexes are objects :)
puts bear_string.split(bear_match_pattern).to_s # => ["WTF", "A BEAR", "A GRIZZLY BEAR"]
