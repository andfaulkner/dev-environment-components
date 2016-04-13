#!/usr/bin/ruby
##########################################
#            CREATING ARRAYS             #
##########################################

# create array with repeated element
puts "\n-------  CREATE ARRAY WITH REPEATED ELEMENT  -------"
names = Array.new(4, "mac")
puts names.to_s							# => [nil, nil, nil, nil]

puts "\n-------  CREATE ARRAY EXPLICITLY FROM INDIVIDUAL ELEMENTS  -------"
numbers = [1, 2, 3, 18, 44]
puts numbers.to_s						# => ["1", "2", "3"]

puts "\n-------  CREATE EMPTY ARRAY OF A GIVEN LENGTH  -------"
empties = Array.new(4)
puts empties.to_s						# => [nil, nil, nil, nil]

puts "\n-------  CREATE NUMERIC ARRAY FROM A RANGE  -------"
digits_range = Array(0..9)	# => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
puts digits_range.to_s

puts " ----- CREATE NUMERIC ARRAY FROM A RANGE, WITH THE LAST NUMBER EXCLUDED -----"
digits_range_nolast = Array(0...9)	# => [0, 1, 2, 3, 4, 5, 6, 7, 8]
puts digits_range_nolast.to_s

puts "\n-------  CREATE ALPHABETIC ARRAY FROM A RANGE  -------"
digits_range = Array("a".."d")	# => ["a", "b", "c", "d"]
puts digits_range.to_s


##########################################
#           DISPLAYING ARRAYS            #
##########################################
# display entire array in 1 line, in a [] - method 1
puts "#{names}"
# display entire array in 1 line, in a [] - method 2
puts names.to_s
# display array 1 line at a time (1 item per line)
puts names

##########################################
#    CONCATENATING & MUTATING ARRAYS     #
##########################################
puts "\n-------  CONCATENATING AND MUTATING ARRAYS  -------"

new_test_array = [1, 'item2', 3, 'carlson', 29, 1, 'omnomnomnom', 5, 'bear', 'meeka', 'moom', 12]
puts new_test_array.to_s

puts "\n-------  CREATE A NEW ARRAY BY COMBINING 2 OTHER ARRAYS  -------"
names_digits = names + digits_range
puts names_digits.to_s			# => ["mac", "mac", "mac", "mac", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

puts "\n-------  ADD A SINGLE ELEMENT TO THE END OF AN ARRAY - push -------"
names_extended = names << 'johnson' ## note that this mutates array 'names' also
puts names_extended.to_s		# => ["mac", "mac", "mac", "mac", "johnson"]
	# OR
names_extended.push('groooooo')			## mutates array names also
puts names_extended.to_s		# => ["mac", "mac", "mac", "mac", "johnson"]

puts "\n-------  REMOVE A SINGLE ELEMENT FROM THE END OF AN ARRAY - pop -------"
puts new_test_array.pop
puts new_test_array.to_s

puts "\n-------  CONCATENATE 2 ARRAYS WITH DUPLICATES REMOVED  -------"
numbers_digits = numbers | digits_range
puts numbers_digits.to_s		# => [1, 2, 3, 18, 44, 0, 4, 5, 6, 7, 8, 9]

puts "\n-------  Remove duplicates from array"
arr = Array(0..1000)
arr.push(2)
arr_with_no_duplicates = arr | []

# convert array into a string, with no separator between elements
puts "\n-------  CONVERT ARRAY INTO STRING, WITH NO SEPARATOR BETWEEN ELEMENTS  -------"
puts names_extended.join						# => macmacmacmacjohnsongroooooo

puts "\n-------  CONVERT ARRAY INTO STRING, WITH GIVEN SEPARATOR BETWEEN ELEMENTS  -------"
puts names_extended.join '::'				# => mac::mac::mac::mac::johnson::groooooo
	# OR
puts names_extended.join(sep='|||')	# => mac|||mac|||mac|||mac|||johnson||groooooo

puts "\n-------  INSERT ARRAY INTO ARRAY AS AN ELEMENT  -------"

puts " ----- REVERSE AN ARRAY -----"
[1, 2, 3].reverse #=> [3, 2, 1]

puts " ----- DELETE ITEM FROM ARRAY -----"
my_arr = ['boo', 'boogabooga', 'ababababa', 'gr', 'hm?']
puts my_arr.delete('boogabooga')
# deleting an item from an array returns the original item

puts " ----- DISPLAY ORIGINAL ARRAY AFTER DELETION -----"
puts my_arr

##########################################
#       GETTING ITEMS FROM ARRAYS        #
##########################################
letters = ["a", "b", "c", "d", "e", "f", "g", "h"]

puts "\n-------  GET ITEM FROM ARRAY  -------- "
# get element at location (starting from 0)
puts letters[4]						# => e 		(5th element in array letters)
puts letters[-0]					# => a 		(first element in array - the "-" before 0 is meaningless)
puts letters[200]					# => 			(index out of bounds returns nil, outputs nothing)
puts " ----- GET ITEM FROM END OF ARRAY USING NEGATIVE INDEX - REVERSE INDEX LOOKUP -----"
puts letters[-1]					# => h 		(the last element in the array)

puts "\n-------  GET MULTIPLE ITEMS FROM AN ARRAY  -------- "
# get elements between locations
puts letters[0,2].to_s	# => ["a", "b"]  (gets first 2 items, outputs as string)
puts letters[0,5].to_s	#=> ["a", "b", "c", "d", "e"] (1st 5 items of array)
puts letters[0..5].to_s	#=> ["a", "b", "c", "d", "e", "f"] (between 1st & 6th arr item, inclusive)
puts letters[0...5].to_s	#=> ["a", "b", "c", "d", "e"] (between 1st & 6th arr item, exclusive)

puts "\n--------  CHANGE ARRAY ELEMENT  --------"
letters[2] = 'CEE'
puts letters.to_s			# => ["a", "b", "CEE", "d", "e", "f", "g", "h"]

puts "\n-------  CHANGE RANGE OF ARRAY ELEMENTS SIMULTANEOUSLY  --------"
letters[0..1] = ['AY', 'BEE']
puts letters.to_s			# => ["AY", "BEE", "CEE", "d", "e", "f", "g", "h"]


puts "------------------------------------------------------------------------------------------"
################################################
#          DELETING ITEMS FROM ARRAYS          #
################################################
puts "***************** DELETING ITEMS FROM ARRAYS *****************"


puts "\n-------  DELETE AN ARRAY ELEMENT AND RETURN IT  --------"
# Delete element based on location in array
puts letters.delete_at(2)	# => "CEE"		(deleted element gets returned)
puts letters.to_s					# => ["AY", "BEE", "d", "e", "f", "g", "h"] (array no longer has del el)
# Delete element based on its value
puts letters.delete("AY")	# => "AY"
puts letters.to_s					# => ["BEE", "d", "e", "f", "g", "h"] (array no longer has del el)

puts "\n-------  DELETE RANGE OF ARRAY ELEMENTS AND RETURN THEM  --------"
puts letters.slice!(2..3).to_s	# => ["e", "f"]	
puts letters.to_s								# => ["BEE", "d", "g", "h"]

##########################################
#            SORTING ARRAYS              #
##########################################
letters_two = ['b', 'a', 'd', 'e', 'c', 'i', 'j', 'f', 'h', 'g']

puts "\n-------  SORT AN ARRAY ALPHABETICALLY  --------"
puts letters_two.sort.to_s		# => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]

puts "\n-------  SORT AN ARRAY ALPHABETICALLY  --------"
puts letters_two.sort.to_s		# => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]

##########################################
#            MUTATING ARRAYS             #
##########################################


##########################################
#         BASIC ARRAY OPERATIONS         #
##########################################

# get array length
puts "\n-- GET ARRAY LENGTH --"
puts names.size					# => 6
puts names.length				# => 6
puts [].length 					# => 0	#empty arrays have length 0

# Check if array is empty
puts "\n-------  DETERMINE IF ARRAY IS EMPTY  -------"
puts [].empty?

#
# a lot of awesome things can be done with Ruby arrays.
# See http://www.tutorialspoint.com/ruby/ruby_arrays.htm
#
