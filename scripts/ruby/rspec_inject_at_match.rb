#!/usr/bin/env ruby

require 'rspec'
require 'factory_girl'
require 'pry'
require './inject_at_match'

# define factory_girl factories
def factories
	FactoryGirl.define do
	  factory :arguments do
	    before true
	    after false
	    wildside false
	    initialize_with { new(["--before", "hello", "goodbye"])}
	  end
	end
end

# Determine RSpec behaviour
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods # give access to factory girl methods in RSpecs
  # load up factories before running any tests
  config.before(:suite) do
    FactoryGirl.find_definitions
		FactoryGirl.reload
		factories
  end
end

inclusions = ["USAGE", "inject_at_match", "filename", "regex", "--before", "--after", "--wildside"]

describe "inject_at_match" do

	describe "responds with usage when incorrect args given" do
		it "displays help file if no args given" do
			expect(`inject_at_match.rb`).to include(*inclusions)
		end
		it "displays help file if only 1 arg given" do
			expect(`inject_at_match.rb`).to include(*inclusions)
		end
		it "displays help file if only 2 args given" do
			expect(`inject_at_match.rb`).to include(*inclusions)
		end
		it "displays help file if only 3 args given" do
			expect(`inject_at_match.rb`).to include(*inclusions)
			# you could also do this but it's slow:
			# 	inclusions.each {|inclusion| expect(`inject_at_match.rb`).to include(inclusion) }			
		end
	end

	describe "Arguments class" do
		it "is able to be built as a factory" do
			expect(build(:arguments)).to_not be_nil
		end
		it "has a default 'wildside' value that is falsey" do
			arguments = build(:arguments)
			expect(arguments.wildside).to be_falsey
		end
		it "has a factory with a default 'before' value that is truthy" do
			arguments = build(:arguments)
			expect(arguments.before).to be_truthy
		end
		it "has a factory with a default 'after' value that is falsey" do
			arguments = build(:arguments)
			expect(arguments.after).to be_falsey
		end
		it "has factory w/ 'args' containing ['hello', 'goodbye'] (both strings); excludes '--before'" do
			arguments = build(:arguments)
			expect(arguments.args).to contain_exactly('hello', 'goodbye')
			expect(arguments.args).to all(be_a(String)) # they must both be strings
		end
	end

	describe "Can insert a line" do
		before(:each) do
			puts "TODO: CREATE A FILE IN HERE"
		end
	end

	describe "random tests: " do
		it "dividing by zero should raise exception" do
			# includes a message
		  expect { 3 / 0 }.to raise_exception(ZeroDivisionError), "apparently 3 can be divided by 0"
		end
	end
end