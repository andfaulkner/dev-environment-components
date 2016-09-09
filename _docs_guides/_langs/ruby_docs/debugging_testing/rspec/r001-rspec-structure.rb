
# Basic structure of an RSpec test
describe "Something" do
  it "does something" do
  	#'expect' items here (aka asserts)
  end
	it "asdf" do
  	#more 'expect' items here (aka asserts)
	end
end

# Contexts
context 'when using a cool-ass method' do
	describe ".my_cool_method" do
		it "creates this cool thing" do
			expect(true).to be true
		end
	end
end

#************************************ SHARED EXAMPLES ************************************
# 		*   let you describe behaviour of classes or modules. 
# 		When declared, a shared group's content is stored.
# 		 It is only realized in the context of another example group, which provides
# 		 any context the shared group needs to run.
# 		 Files containing shared groups must be loaded before the files that use them
RSpec.shared_examples "test greetings" do |greeting|
  # Same behavior is triggered also with either `def something; 'some value'; end`
  # or `define_method(:something) { 'some value' }`
  let(:something) { greeting }
  it "is a greeting" do
    expect(['aloha', 'hello', 'bonjour']).to include(greeting)
  end
end

RSpec.describe '.greet' do
  include_examples "test greetings", "aloha"
  include_examples "test greetings", "bonjour"
end
