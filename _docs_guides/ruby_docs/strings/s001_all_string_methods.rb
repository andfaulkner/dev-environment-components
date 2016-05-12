#!/usr/bin/ruby



###################################### TRANSFORMING STRINGS #######################################

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

puts " ----- SWITCH THE CASE OF EACH LETTER IN A STRING -----"
puts "ThIs_STRING_is_SO_lEet_wut_WUT".swapcase  #=> tHiS_string_IS_so_LeET_WUT_wut
puts "A MORE OBVIOUS example here". swapcase    #=> a more obvious EXAMPLE HERE


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

puts " ----- REPLACE ALL INSTANCES OF ANY NUMBER OF INDIVIDUAL CHARACTERS  -----"
puts "i am another string".tr('a', '1')				#=> i 1m 1nother string
puts "i am another string".tr('as', '1')			#=> i 1m 1nother 1tring
puts "i am another string".tr('a-m', '1') 		#=> 1 11 1not11r str1n1


puts "------------------------------------------------------------------------------------------"
#########################################################################
#          SUCCESSORS (GENERATE NEXT IN A 'SERIES'/'SEQUENCE')          #
#########################################################################
puts "***************** SUCCESSORS (GENERATE NEXT IN A 'SERIES'/'SEQUENCE') *****************"
puts " ----- GENERATE SUCCESSOR TO A REGULAR STRING -----"
puts "string".succ # => strinh
# ALTERNATIVELY...
puts "string".next # => strinh

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


puts "------------------------------------------------------------------------------------------"
####################################
#          CONCAT STRINGS          #
####################################
puts "***************** CONCAT STRINGS *****************"

puts " ----- CONCAT 2 STRINGS WITH + -----"
p "hello" + " meeka!" # => hello meeka!

puts " ----- CONCAT 2 STRINGS WITH << -----"
p "hello" << " meeka!" # => hello meeka!

puts " ----- CONCAT 2 STRINGS WITH String#concat -----"
p "hello".concat(" meeka!") # => hello meeka!


puts "------------------------------------------------------------------------------------------"
#####################################
#          SEARCH A STRING          #
#####################################
puts "***************** SEARCH A STRING *****************"
puts " ----- SEARCH A STRING FOR A REGEX OR SUBSTRING, RETURN ALL MATCHES IN AN ARRAY -----"
"meeka eats poop sometimes".scan(/(?<=\s)[a-zA-Z]*(?=\s)/)			# => ["eats", "poop"]

puts " ----- SEARCH A STRING FOR A REGEX OR SUBSTRING, RETURN THE FIRST MATCH -----"
"meeka eats poop sometimes".match(/(?<=\s)[a-zA-Z]*(?=\s)/)			# => #<MatchData "eats">
	# convert with to_s
                                                           			# 


                                                           			# 
######################################### STRING TESTING #########################################

##############################
# CHECK START AND END VALUES #
##############################

puts "\n------ DETERMINE IF STRING STARTS WITH GIVEN SEQUENCE ------"
puts "hello".start_with?("hell")

puts "\n------ DETERMINE IF STRING ENDS WITH GIVEN SEQUENCE ------"
puts "hello world".end_with?("world")




######################################### MISC #########################################


puts "------------------------------------------------------------------------------------------"
#########################################
#          DUPLICATING STRINGS          #
#########################################
puts "***************** DUPLICATING STRINGS *****************"
dog_1 = 'meeka'
dog_2 = dog_1.dup
puts dog_2						#=> meeka

puts 'meeka'.methods.sort - Object.new.methods

puts 'meeka'.next


# puts "bootaboo yesm".tr("yesm")




puts "------------------------------------------------------------------------------------------"
#######################################################################
#          ALPHABETIZATION / ALPHABETICAL ORDERING, ALTERING          #
#######################################################################
puts "***************** ALPHABETIZATION / ALPHABETICAL ORDERING, ALTERING *****************"

puts " ----- DETERMINE IF WORD IS ALPHABETICALLY BETWEEN 2 OTHERS (LIKE IN THE DICTIONARY) -----"
puts 'muffin'.between?('chicken', 'pig')					#=> true
puts 'muffin'.between?('cab', 'derpaderpderp')		#=> false



puts "------------------------------------------------------------------------------------------"
#############################
#          PADDING          #
#############################
puts "***************** PADDING *****************"

puts " ----- LEFT PAD A STRING -----"
puts "asdf".ljust(5) #=> asdf 	< answer betw area marked by lines below str; incl 1 space past end
								     #   |    |  

puts "asdf".ljust(5) + '|' 				#=> asdf |


puts " ----- RIGHT PAD A STRING -----"
puts "asdf".rjust(7) #=>     asdf  < ans betw area marked by lines under str; incl 3 space b4 start
								     #   |      |

puts "|" + "asdf".rjust(7) #=> |   asdf


puts " ----- CENTRE A STRING-----"
#
# 	Center a string
# 	@str {String} String to center
# 	@pad {FixNum} Amount of padding to apply in total
# 								E.g. a 4 letter word w/ pad=6 will have 1 space on each side.
# 										 a 4 letter word w/ pad=7 will have 1 space on the left, 2 on the right
#
def center(str, pad)
	if p (pad - str.size).even?
		rpad = lpad = (pad - str.size)/2
	else
		lpad = ((pad - 1) - str.size) / 2
		rpad = (((pad - 1)  - str.size) / 2) + 1
	end
	str.ljust(str.size + lpad).rjust(str.size + lpad + rpad)
end

p center('asdf', 8)

