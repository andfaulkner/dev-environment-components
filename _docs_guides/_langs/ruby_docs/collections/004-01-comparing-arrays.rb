#!/usr/bin/ruby
#Comparing Arrays
#================

#Subtractive array comparison
#----------------------------
#   example:

		first_array - second_array

#   returns all array items in first_array but not second_array

#   full example:

    old_inventory = File.open('old-inventory.txt').readlines
    new_inventory = File.open('new-inventory.txt').readlines
    new_inventory - old_inventory

    #		this snippet tells Ruby to “send the array named old_inventory the
    #		message named ‘ - ’ with the argument being the array named by new_inventory .”

#Additive array comparison
#----------------------------
#   returns all items from both arrays

#   example:

		first_array && second_array



# arr1 && arr2 - return second array if 1st array / variable exists  
#------------------------------------------------------------------
#   returns all items present in both arrays

#   example
first_array = ["a", "b", "c", "d"]
second_array = ["c", "d", "e", "f"]

conglomerate_array = first_array && second_array
puts conglomerate_array
# => ["c", "d"]

