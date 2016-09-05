# Enumerable:
# 	module that provides access to each, reduce, collect, map, each_with_index, etc. when
# 	mixed into an object. Part of Hash & Array by default.

# Enumerator:
# 	external iterator form of enumerable. Returned by methods on Enumerable that aren't passed
# 	a block. It can then iterate by being passed next, rewind, etc.


puts "------------------------------------------------------------------------------------------"
###################################################################
#          GET AN ENUMERATOR FROM A METHOD ON ENUMERABLE          #
###################################################################
puts "***************** GET AN ENUMERATOR FROM A METHOD ON ENUMERABLE *****************"
puts " ----- GET AN ENUMERATOR BY MAKING AN ARRAY & CALLING EACH ON IT W/OUT GIVING A BLOCK -----"
fibonnaci_array = [1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
fibonnaci_enumerator = fibonnaci_array.each 

puts fibonnaci_enumerator

puts " ----- MAKE AN ENUMERATOR BY CALLING to_enum ON AN ENUMERABLE -----"
fib_enum_two = fibonnaci_array.to_enum

puts fib_enum_two


puts "------------------------------------------------------------------------------------------"
###################################################
#          GET VALUES FROM AN ENUMERATOR          #
###################################################
puts "***************** GET VALUES FROM AN ENUMERATOR *****************"

puts " ----- GET THE NEXT VALUE IN AN ARRAY WRAPPED BY ENUMERATOR -----"
puts fibonnaci_enumerator.next # => 1
puts fibonnaci_enumerator.next # => 2
puts fibonnaci_enumerator.next # => 3
puts fibonnaci_enumerator.next # => 5
# each successive call returns the following number in the array

puts " ----- REWIND THE ENUMERATOR TO THE BEGINNING -----"
fibonnaci_enumerator.rewind
puts fibonnaci_enumerator.next # => 1   <<< next now returns the 1st item in the array again


puts "------------------------------------------------------------------------------------------"
##############################################################################
#          CREATE ENUMERATORS FROM STRINGS (STRS ARE NON-ENUMERABLE)          #
##############################################################################
puts "***************** CREATE ENUMERATORS FROM STRINGS (STRS ARENT ENUMERABLEs) *****************"

puts " ----- CREATE ENUMERATOR THAT RETURNS CHARS FROM A STRING ONE AT A TIME -----"
str_enum = "I am a string".each_char
p str_enum
p str_enum.next # => "I"
p str_enum.next # => " "
p str_enum.next # => "a"

puts " ----- CREATE ENUMERATOR THAT RETURNS LINES FROM A STRING ONE AT A TIME -----"
str_line_enum = "I am a multiline string \n and here is the 2nd line \n and 3rd".each_line
p str_line_enum.next # => "I am a multiline string \n"
p str_line_enum.next # => " and here is the 2nd line \n"
p str_line_enum.next # => " and 3rd"
