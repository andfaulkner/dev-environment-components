#!/usr/bin/env ruby

require 'rspec'
require 'factory_girl'
require 'pry'

inject_at_match_path = "../../scripts/ruby/inject_at_match.rb"

require inject_at_match_path

require './scripts/filesystem'

# auto-require all ruby files in a given directory. Recursively requires "depth" # of dirs deep.
# when depth is one, it only requires files directly inside the given dir - no files in subdirs.
def require_dir_relative_to_pwd(dir, depth=1, ext="rb")
	ext.chop! if ext.start_with?(".")

	levels = ((depth > 0) ? depth : 1).to_i
	levels.times do |i|
		Dir.glob("#{Dir.pwd.to_s}/#{dir}#{"/*" * i}/*.#{ext}").each {|test_file|
			require "#{test_file.sub(/#{Dir.pwd.to_s}\/#{dir}\/(.+)\.#{ext}/, "./#{dir}/\\1")}"
			puts "success! got #{test_file} from #{dir}!"
		}
	end
end

require_dir_relative_to_pwd("scripts", 2)
require_dir_relative_to_pwd("spec/helpers", 1)

puts FileHandlers

puts "PWD: #{Dir.pwd}"
puts "HOME: #{Dir.home}"

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

	FactoryGirl.define do
	  factory :systeminfo do
	    initialize_with { new("system info intialized by factory!")}
	  end
	end

end

sysss = SystemInfo.new("my_note")
puts "EXPERIMENT!"
puts sysss.home_dir

# Determine RSpec behaviour
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods # give access to factory girl methods in RSpecs.
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
			expect(`#{inject_at_match_path}`).to include(*inclusions)
		end
		it "displays help file if only 1 arg given" do
			expect(`#{inject_at_match_path}`).to include(*inclusions)
		end
		it "displays help file if only 2 args given" do
			expect(`#{inject_at_match_path}`).to include(*inclusions)
		end
		it "displays help file if only 3 args given" do
			expect(`#{inject_at_match_path}`).to include(*inclusions)
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
			expect(arguments.wildside).to be false
		end
		it "has a factory with a default 'before' value that is truthy" do
			arguments = build(:arguments)
			expect(arguments.before).to be true
		end
		it "has a factory with a default 'after' value that is falsey" do
			arguments = build(:arguments)
			expect(arguments.after).to be_falsy
		end
		it "has factory w/ 'args' containing ['hello', 'goodbye'] (both strings); excludes '--before'" do
			arguments = build(:arguments)
			expect(arguments.args).to eq(['hello', 'goodbye'])
			puts "\n\narguments.args: #{arguments.args}\n\n"
			binding.pry
			arguments.args.each {|arg| puts arg.kind_of?(String)}
			expect(arguments.args).to all(be_a_kind_of(String)) # they must both be strings
		end
	end

	describe "Can insert a line" do
		before(:each) do
			puts "TODO: CREATE A FILE IN HERE"
		end
	end

end


### CONTEXTS: tool to make your tests clear and well organized
## 						just a alias method of “describe". No functional difference
## 	DESCRIBE: wrap a set of tests against one functionality
## 	CONTEXT:  wrap a set of tests against one functionality under the same state e.g.

	describe "random tests: " do
		it "dividing by zero should raise exception" do
			# includes a message
		  expect { 3 / 0 }.to raise_exception(ZeroDivisionError), "apparently 3 can be divided by 0"
		end
	end