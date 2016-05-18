

group :test, :development do
	gem "anima", "0.2.0"
	gem "morpher", "0.2.3"
	gem "mutant", "0.5.26"
	gem "mutant-rspec", "0.5.26"
end

group :development do
  gem 'pry-rails'
  gem 'hirb'
  gem 'pry-awesome_print'
  gem 'better_errors'
end