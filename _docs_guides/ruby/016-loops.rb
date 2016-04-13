
puts "------------------------------------------------------------------------------------------"
###############################
#          FOR LOOPS          #
###############################

puts "***************** for LOOPS *****************"
for current_num in 1..5 do
	p "#{current_num}"
end
# => "1"
# => "2"
# => "3"
# => "4"
# => "5"

puts " ----- for-in LOOPS -----"
for num in 1..3 do
	p "Number #{num}"
end
# => "Number 1"
# => "Number 2"
# => "Number 3"

for item in ["b", "woof", "yum"] do
	p "item in array: #{item}"
end
# => "item in array: b"
# => "item in array: woof"
# => "item in array: yum"


puts "------------------------------------------------------------------------------------------"
########################################################
#          FIXNUM LOOPS (times, upto, downto)          #
########################################################
puts "***************** FIXNUM LOOPS (times, upto, downto) *****************"

puts " ----- times LOOPS -----"
3.times do |num|
	puts num
end
# => 0
# => 1
# => 2

3.times do
	puts 'hello!'
end
# => "hello!"
# => "hello!"
# => "hello!"

4.downto(2) do |num|
	puts "downto loop number: #{num}"
end
# => downto loop number: 4
# => downto loop number: 3
# => downto loop number: 2

6.upto(9) do |num|
	puts "upto loop number: #{num}"
end
# => upto loop number: 6
# => upto loop number: 7
# => upto loop number: 8
# => upto loop number: 9



puts "------------------------------------------------------------------------------------------"
#################################################
#          HIGHER ORDER FUNCTION LOOPS          #
#################################################
puts "***************** HIGHER ORDER FUNCTION LOOPS *****************"

puts " ----- each LOOPS -----"
(1..3).each do |num|
	puts num
end
# => 1
# => 2
# => 3

['yes', 'no', 'maybe?'].each do |word|
	puts word
end
# => yes
# => no
# => maybe?


puts "------------------------------------------------------------------------------------------"
#####################################################################
#          GENERATE A MULTIPLICATION TABLE USING FOR LOOPS          #
#####################################################################
puts "***************** GENERATE A MULTIPLICATION TABLE USING FOR LOOPS *****************"

for num_one in (1..9) do
	arr = []
	for num_two in (1..9) do
		arr.push(num_one * num_two)
	end
	p arr.map {|num| "#{num}".ljust(4) }.join(' ').strip
end


arr = Array(0..10)
arr.push(4).shuffle!
# puts my_arr
# p my_arr.product(my_arr)
# p my_arr.product(my_arr).map {|product_array|
# 	product_array[0] == product_array[1] ? product_array[0] : nil
# }.compact

p arr.combination(2).to_a.map {|n| n[0] if n[0] == n[1]}.compact