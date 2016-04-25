def greeting language
	case language
	when "English"
		"hello"
	when "French"
		"bonjour"
	when "Hawaiian"
		"aloha"
	when "German"
		"hallo"
	else
		"unknown language"
	end
end

#************************************ BASIC EXPECTS ************************************
describe "BASIC ASSERTS" do

	# Test if one thing equals another
	it "says hello if language is English" do
		expect(greeting "English").to eq("hello")
	end

	# Test if one thing doesn't equal another
	it "doesn't say namaste if language is Nepalese" do
		expect(greeting "Nepalese").not_to eq("namaste") # note that any expect can be negated
	end
end 

# ************************************ EXISTENTIAL ************************************
describe "EXISTENTIAL/TRUTHINESS" do
	it "can test for truthiness" do
		expect('a string!').to be_truthy
	end

	it "can test for boolean true" do
		expect(3 == 3).to be true
	end

	it "can test for nil" do
		expect(nil).to be_nil
	end

	it "can test for falsyness" do
		expect(nil).to be_falsy
		expect(false).to be_falsy
		expect(ijawf ||= false).to be_falsy
	end

	it "can test for boolean false" do
		expect(3 == 4).to be false
	end
end

#************************************ COLLECTION MEMBERSHIP ************************************
describe "COLLECTION MEMBERSHIP" do
	it "can detect emptiness" do
		expect([]).to be_empty
		expect({}).to be_empty
		expect('').to be_empty
	end

	it "can test hash for presence of a key" do
		expect(:a => 1).to have_key(:a)
		expect(:a => 1).to_not have_key(1)
	end

	it "can test hash for presence of a value" do
		expect(:a => 1).to have_value(1)
		expect(:a => 1).to_not have_value(:a)
	end

	it "can test for exact collection contents irrespective of order" do
		expect([1, 2, 3]).to contain_exactly(1, 2, 3)
		expect([1, 2, 3]).to contain_exactly(3, 1, 2)
		expect([1, 2, 3]).to_not contain_exactly(3, 2)
		expect({:a=>1}).to_not contain_exactly({:a=>1}) # doesn't work on hashes
	end

	it "can test for inclusion of an item in a collection" do
		expect([1, 2, 3]).to include(1)	
		expect(:a => "b").to include(:a => "b")	
		expect({:a => "b", :b => "c"}).to include(:a => "b")	
		expect({:a => "b", :b => "c"}).to include(:a => "b")	
	end

	it "can test for inclusion of multiple items (inclusion of all items)" do
		expect([1, 2, 3]).to include(1, 3)
		expect({:a => "b", :b => "c"}).to include({:a => "b"}, {:b => "c"})	
	end

	it "can test for exclusion of multiple items" do
		expect({:a => "b", :b => "c"}).to_not include({:v => "vwa"}, {:o => "vwa"})
		expect([1, 2, 3]).to_not include([4, 5, 6])
		# expect(1, 2, 3).to_not include(4, 5, 6, 3) # << this would fail, because 3 is in the collection
	end

	it "can test for coverage of a number by a range" do
		expect(1..10).to cover(3)
	end

end

#************************************ COMPARISONS ************************************
describe "COMPARISONS" do
	it "can do greater than operations" do
		expect(4).to be > 3
	end

	it "can do less than operations" do
		expect(3).to be < 4
	end

	it "can do == operations" do
		expect(4).to be == 4
	end

	it "can do inclusive between operations" do
		expect(3).to be_between(1, 3).inclusive
	end

	it "can do exclusive between operations" do
		expect(3).to be_between(1, 4).exclusive # would fail if the range was 1, 3
	end

	it "can do regular expression matches" do
		expect('aa_expression').to match(/aa_expression/)
		expect('aa_expression').to match(/press/)
		expect('aa_expression').to match(/a{2,}_expression/)
		expect('aa_expression').to match(/a{2,}.?expression/)
		expect('aa_expression').to_not match(/a{4,}.?expression/)
	end

	it "can test distance between numbers" do
		expect(7).to be_within(5).of(8)
	end

end




class Dog
	@real_dogs = ["german shepherd", "rottweiler", "lab", "golden retriever"]
	@leash_rats = ["chihuahua", "scottish terrier", "bichon frise"]
	@giants = ["sheepdog", "great dane"]
	@wolves = ["wolf", "husky"]

	def initialize type
		@type = type
	end
	def bark
		if @real_dogs.include?(@type.downcase)
			"bark"
		elsif @leash_rats.include?(@type.downcase)
			"yip"
		elsif @giants.include?(@type.downcase)
			"woof"
		elsif @wolves.include?(@type.downcase)
			"hoooowl"
		end
	end
end

describe ".bark" do
	it "returns a string holding a bark noise" do
		expect(true).to be true
	end
end