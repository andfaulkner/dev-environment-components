INSTALLING RSPEC
================
*   Add this to your Gemfile, within the :test, :development group:

				group :development, :test do
						#...
						gem 'rspec'
						gem 'rspec-rails', '~> 3.0'
						#...
				end

*   Install rspec onto your system. On the CLI:

				gem install rspec
				bundle install

Install into Rails project
--------------------------
*   All preceding steps still needed, but also run the following from project root: 
				rails generate rspec:install

*   this will add the following files:
		*   .rspec 																																					 	 [[PATH]]
		*   spec/spec_helper.rb																															 	 [[PATH]]
		*   spec/rails_helper.rb																															 [[PATH]]

*   henceforth running rails generators will create spec units tests rather than Test::Unit tests

Running rspec (in a rails project)
----------------------------------

### Run all rspec tests (specs)
*   run this on the CLI, from the project root:

        bundle exec rspec

*   this will run all *_spec.rb files in the spec directory

### Run a subset of rspec tests (specs)
*   Examples:

				bundle exec rspec spec/models

				*   runs only 'model' specs

				bundle exec rspec spec/controllers/accounts_controller_spec.rb

				*   runs only that specific spec file, for AccountsController