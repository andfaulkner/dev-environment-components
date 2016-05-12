#Describe
*   should name a method
*   .method_name if it's a class method
*		#method_name if it's a class method

#Contexts
*   start them with "when" or "with"

#Descriptions (describe, context, it)
*   SHORT! Under 40 chars is ideal
*   split using a context if it gets longer than that

#Assertions / test
*   only one assertion per test!

#Expect vs Should
*   ALWAYS use expect. 

#Subject
*   DRY tests with a subject if many are related to it.

		subject(:login) { Login.first }
		it "accepts a password" do
		  #...
		end

# Variables
*   Always assign with let rather than an instance variable. This is faster.
				describe '#type_id' do
				  let(:resource) { FactoryGirl.create :device }
				  let(:type)     { Type.find resource.type_id }

				  it 'sets the type_id field' do
				    expect(resource.type_id).to equal(type.id)
				  end
				end

*   Do not use a before block to create an instance variable
	  		#!!! BAD !!!#   before { @type = Type.find @resource.type_id } #!!! BAD !!!#

#Mocks, fixtures, factories
*   Mocks: sparing use, try to test real behaviour as much as possible
*   Fixtures: Never use them. Too hard to control
*   Factories: Use them instad of fixtures. E.g.
				user = FactoryGirl.create :user
						*   But use as few as possible - try to test real behaviour instead


