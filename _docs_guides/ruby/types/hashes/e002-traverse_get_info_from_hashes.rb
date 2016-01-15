#!/usr/local/bin/ruby




puts "------------------------------------------------------------------------------------------"
##################################################
#          RUN A BLOCK ON EACH HASH KEY          #
##################################################
puts "***************** RUN A BLOCK ON EACH HASH KEY *****************"

# 1)For each item in the hash table...
#   1.1) Grab current item's hash key (cur_key)
#   1.2) get the value attached to the hash key
#   1.3) check the value's type, then...
# 	  1.3a) if value's type is hash then
# 		  1.3a.i) Grab the value, and pass it into this process again, from step 1
# 	  1.3b) if value's is not hash then
# 		  1.3b.i) move to next key, return to step 1.1.
#   each time a

blocka = lambda {|key, hash|
	val = hash[key]
	puts val.class 
	puts hash[key]
}


fruit_colors.each_key do |key|
	blocka.call(key, fruit_colors)
end