
module Trainable
	def Trainable.add_trick
	  if name.to_s.match(/trick/)
	  	puts "new trick added: #{name}"
	  	@tricks << name.to_s
	  	@hunger = @hunger + 1
	  end
	end
	def self.included(base)
		puts "self.included::"
		puts base
  	base.extend(Trainable)
	end
end

class Dog
	include Trainable

	attr_reader :hunger, :tricks
	attr_accessor :name, :age, :breed, :hunger, :bark_sound

	def initialize(name="dog", opts={})
		puts "initializing Dog"
		@name = name
		@age = opts[:age] || 0
		@breed = opts[:breed] || "mutt"
		@bark_sound = opts[:bark_sound] || "arf"
		@hunger = 0
		@tricks = opts[:tricks] || [];
		puts Trainable::add_trick
	end

	def self.method_added(name, &args)
		Trainable::add_trick
	end 

	def singleton_method_added(name, &args)
	  if name.to_s.match(/trick/)
	  	puts "new trick added: #{name}"
	  	@tricks << name.to_s
	  	@hunger = @hunger + 1
	  end
	end 

	def train_to_have_new_bark(bark_sound)
		@bark_sound = bark_sound
	 	@hunger = @hunger + 1
	end

	def bark(times = 3)
		puts "#{@name} goes #{@bark_sound * times}"	
  	@hunger = @hunger + 1
	end

	def feed
		@hunger = 0
	end
end
