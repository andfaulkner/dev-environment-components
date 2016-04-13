

letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
p letters


puts "------------------------------------------------------------------------------------------"
###############################################
#          REVERSE AN ARRAY BY HAND          #
###############################################
puts "***************** REVERSE AN ARRAY BY HAND  *****************"

def reverse_arr(arr)
	rev_arr = [];
	(arr.size - 1).downto(0) do |i|
		rev_arr.push(arr[i])
	end
	rev_arr
end

p reverse_arr(letters)

puts " ----- REVERSE ARRAY BY HAND WITH NO TEMP ARRAY -----"
def reverse_arr_np(arr)
	arr.each.with_index.reduce([]) {|item, (value, index)|
		item.push(arr[arr.size - index - 1])
	}
end

p reverse_arr_np(letters)