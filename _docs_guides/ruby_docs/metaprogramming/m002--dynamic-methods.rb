
puts "------------------------------------------------------------------------------------------"
######################################################
#          GENERATE METHOD NAME DYNAMICALLY          #
######################################################
puts "***************** GENERATE METHOD NAME DYNAMICALLY *****************"
puts " ----- CREATE METHOD THAT CREATES A METHOD NAME FROM COMBINING STRINGS -----"
def relay(arr, data_type)
	arr.map {|item| item.send('to_' + data_type)}
end

puts " ----- ARR ITEMS->INT BY PASS relay A 1 CHAR TYPE 'i' TO CONCAT W to_ TO CALL 'to_i' -----"
relay(['1', '3', '5'], 'i')		# => [1, 3, 5]



puts "------------------------------------------------------------------------------------------"
################################################
#          DEFINE METHODS DYNAMICALLY          #
################################################
puts "***************** DEFINE METHODS DYNAMICALLY *****************"

puts " ----- CREATE CLASS WITH DYNAMICALLY DEFINED METHDOS USING define_method -----"
class Monk
  ["life", "the universe", "everything"].each do |name|
    define_method("meditate_on_" + name.sub(" ", "_")) do
      "I know the meaning of #{name}"
    end
  end
end

monk = Monk.new

puts " ----- CALL DYNAMICALLY CREATED METHODS -----"
p monk.meditate_on_life # => "I know the meaning of life"
p monk.meditate_on_the_universe # => "I know the meaning of the universe"
p monk.meditate_on_everything # => "I know the meaning of everything"
