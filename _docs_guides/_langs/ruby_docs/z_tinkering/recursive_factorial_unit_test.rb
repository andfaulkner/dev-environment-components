require './recursive_factorial'
require 'rspec'

describe "factorial" do
	it "returns 1 if given value is 0" do
		expect(factorial(0)).to eq 1
	end
	it "returns 1 if given value is 1" do
		expect(factorial(1)).to eq 1
	end
	it "returns 2 if given value is 2" do
		expect(factorial(2)).to eq 2
	end
	it "returns 6 if given value is 3" do
		expect(factorial(3)).to eq 6
	end
	it "returns 24 if given value is 4" do
		expect(factorial(4)).to eq 24
	end
	it "returns 120 if given value is 5" do
		expect(factorial(5)).to eq 120
	end
	it "returns 720 if given value is 6" do
		expect(factorial(6)).to eq 720
	end
	it "returns 5040 if given value is 7" do
		expect(factorial(7)).to eq 5040
	end
	it "returns 40320 if given value is 8" do
		expect(factorial(8)).to eq 40320
	end
end
