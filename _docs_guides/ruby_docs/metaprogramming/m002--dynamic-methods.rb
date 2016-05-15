
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


puts "------------------------------------------------------------------------------------------"
######################################################################################
#          DEFINE METHOD WITH CUSTOM METHOD BODY, TRANSFER TO ANOTHER CLASS          #
######################################################################################
puts "***************** DEFINE METHOD WITH CUSTOM METHOD BODY, TRANSFER TO ANOTHER CLASS *****************"

class Ninja
	attr_reader :name
	attr_reader :moves, :times_sig_move_called, :padawans_trained

	def initialize(name, times_sig_move_called=0)
		@name = name
		@times_sig_move_called = times_sig_move_called
		if block_given?
			create_signature_move { yield }
		else
			create_signature_move
		end
	end

	def train_padawan(ninja)
		if @padawans_trained && @padawans_trained.include?(ninja)
			puts "I CANNOT RETRAIN THE SAME PADAWAN WITH THE SAME MOVE, FOOL!"
		else
			transfer_move_to_padawan(ninja)
		end
	end

	def move_assault
		puts "\nMOVE ASSAULT BEGINS!!! PREPARE FOR THE WRATH OF #{@name.upcase}!!!!!!!"
		@moves.to_a.each {|move| move["#{move.keys[0]}"][:move].call }
	end

	private

		def create_signature_move
			move_originator = "#{@name}"
			move_name 			= "#{@name}_strike"
			define_singleton_method move_name do
				if block_given?
					yield
					@times_sig_move_called = @times_sig_move_called + 1
				else
					puts "no signature move :("
				end
			end
			@signature_move = self.method("#{@name}_strike") # store the name
			@moves 					= [{"#{move_name}"=>{:move=>@signature_move, :times_called=>0}}]
		end

		def transfer_move_to_padawan(ninja)
			puts "\n#{@name.capitalize} is training padawan #{ninja.name.capitalize}"
			sig_move = @signature_move
			newmove_name = "#{@name}_strike"
			(@padawans_trained ||= []) << ninja
			ninja.moves << {"#{newmove_name}"=>{:move=>sig_move, :times_called=>0 }} 
			ninja.send(:define_singleton_method, newmove_name) { sig_move.call }
		end
end

joe = Ninja.new("joe") { puts "*FIRES GIANT LIGHTNING BOLT*" }
joe.joe_strike
jack = Ninja.new("jack") { puts "**SHOOTS FIREBALL**!" }
jack.jack_strike

joe.train_padawan(jack)
jack.joe_strike

joe.train_padawan(jack)

jack.move_assault

puts jack.times_sig_move_called
puts joe.times_sig_move_called

puts " ----- ABOVE: SHEER MADNESS -----"
