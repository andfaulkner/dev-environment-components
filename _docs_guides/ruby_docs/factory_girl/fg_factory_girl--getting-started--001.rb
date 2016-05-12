
puts "\n\n\n\n\n\n\n------------------------------------------------------------------------------------------"
puts "##########################################################################################"
puts "********************************* Factory_girl gem usage *********************************"
puts "##########################################################################################"


require 'factory_girl'
require './classes_to_test_with_factory_girl.rb'


meeka = Dog.new(name: "meeka", age: 4, breed: "rottweiler german shephard", bark_sound: "woof", tricks: [])

# teach meeka some new tricks
meeka.define_singleton_method(:roll_over_trick) do
	puts "roll over"
end
meeka.define_singleton_method(:shake_a_paw_trick) do
	puts "*shakes paw*"
end
# add a non-trick method
meeka.define_singleton_method(:chase_squirrel) do
	puts "ermagerd a squirrel!"
end

puts "meeka.singleton_methods: #{meeka.singleton_methods}"

# display tricks meeka knows
puts "\n** TRICKS MEEKA KNOWS **"
puts meeka.tricks




puts <<-FACTORY_GIRL_DESCRIPTION
    *   fixtures replacement
    *   multiple build strategies: saved & unsaved instances, attribute hashes, stubbed objects
    *   supports multiple factories for the same class (user, admin_user, etc.)
    *   provides factory inheritance mechanisms
FACTORY_GIRL_DESCRIPTION


puts "------------------------------------------------------------------------------------------"
#########################################################
#          CONFIGURE RSpec TO USE factory_girl          #
#########################################################
puts "***************** CONFIGURE RSpec TO USE factory_girl *****************"
require 'rspec'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end
end
require "rspec/mocks/standalone"


puts "------------------------------------------------------------------------------------------"
######################################
#          DEFINE A FACTORY          #
######################################
puts "***************** DEFINE A FACTORY *****************"
puts <<-DEFINE_A_FACTORY
  *   Each factory has a name and set of attributes.
  *   Name is used to guess the class of the object by default.
      *   However, the class can also be explicitly specified.
DEFINE_A_FACTORY

FactoryGirl.define do
	factory :dog do
		name "Meeka"
		age 5
		breed "Rottweiler German Shephard"
		hunger 0
		bark_sound "woof"

		after(:build) do |dog|
			dog.define_singleton_method(:roll_over_trick) do
				puts "roll over"
			end
		end

	end
end



meeka = FactoryGirl.build(:dog)

puts "about to run tests?"
RSpec.describe "Dog" do
	it "was created with the name 'meeka'" do
		expect(meeka.name).to eq "Meeka"
	end
	it "was created with age 5" do
		expect(meeka.age).to eq 5
	end
end

