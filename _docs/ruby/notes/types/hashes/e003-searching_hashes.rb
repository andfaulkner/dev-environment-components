#!/usr/local/bin/ruby


test_hash_empty = {}
test_hash_1_deep = { :item1=>"Item 1", :item2=>"ITEM 2", :item3=>"Item THREE", :item4=>"iTeM4"}
test_hash_2_deep = { 
	:item1=>"Item 1", 
	:item2=>{
		:i2_1=>"Item2P1",
		:i2_2=>"Item2.2"
	}, 
	:item3=>"Item THREE", 
	:item4=>"iTeM4"
}

puts "------------------------------------------------------------------------------------------"
###########################################################
#          TEST HASH ELEMENTS WITHOUT TRAVERSING          #
###########################################################
puts "***************** TEST HASH ELEMENTS WITHOUT TRAVERSING *****************"

puts " ----- CHECK IF A HASH HAS A CERTAIN KEY -----"
puts test_hash_1_deep.has_key?(:item1) 			# => true
puts test_hash_1_deep.has_key?(:POOOOO) 		# => false
puts test_hash_2_deep.has_key?(:i2_1) 			# => false 	<<< doesn't check recursively for keys

puts " ----- CHECK IF A HASH HAS A CERTAIN VALUE -----"
puts test_hash_1_deep.has_value?("iTeM4") 	# => true
puts test_hash_1_deep.has_value?("POOOOO") 	# => false
puts test_hash_2_deep.has_value?("Item2P1") # => false  <<< nonrecursive

puts " ----- CHECK IF A HASH HAS A CERTAIN VALUE, WHERE VALUE IS A NESTED HASH -----"
# Nested hashes (hashes assigned to keys) are regular values you can check for. 
# Note that the ENTIRE HASH is the assigned value
puts test_hash_2_deep.has_value?({:i2_1=>"Item2P1",:i2_2=>"Item2.2"})  # => true

puts " ----- CHECK IF A HASH IS EMPTY -----"
puts test_hash_empty.empty? 	# => true
puts test_hash_1_deep.empty? 	# => false


puts "------------------------------------------------------------------------------------------"
######################################
#          GET INFO ON HASH          #
######################################
puts "***************** GET INFO ON HASH *****************"

puts " ----- GET LIST OF A HASH'S KEYS -----"
puts test_hash_1_deep.keys.to_s 		# => [:item1, :item2, :item3, :item4]

puts " ----- GET LIST OF A HASH'S VALUES -----"
puts test_hash_1_deep.values.to_s   # => ["Item 1", "ITEM 2", "Item THREE", "iTeM4"]


puts "------------------------------------------------------------------------------------------"
##########################################################
#          FIND KEY-VALUE PAIR IN ONE-DEEP HASH          #
##########################################################
puts "***************** FIND KEY-VALUE PAIR IN ONE-DEEP HASH *****************"

puts " ----- DEFINE AN EXAMPLE HASH -----"
fruit_colors = {:banana=>"yellow", :apple=>"red", :pear=>"green", :grapefruit=>"red"}

puts fruit_colors

puts " ----- FIND A KEY-VALUE PAIR BY KEY, RETURN THE KEY-VAL PAIR AS AN ARRAY -----"
puts fruit_colors.assoc(:banana).to_s

