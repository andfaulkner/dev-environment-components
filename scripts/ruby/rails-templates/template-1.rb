#template-1.rb

# set correct ruby version
run "rbenv local 2.3.1"


puts "------------------------------------------------------------------------------------------"
##################################
#          INSTALL GEMS          #
##################################
puts "***************** INSTALL GEMS *****************"

gem 'oauth2'
gem 'rabl'
gem 'cancan'
gem 'devise'
gem 'delayed_job'
gem 'bootstrap-sass'
gem 'squeel'
gem 'skylight'
gem 'grape'
gem 'roo'
gem 'draper'
gem 'ice_cube'
gem 'bcrypt'
gem 'rails'
gem 'pg'
gem 'rails_12factor'
gem 'redis-session-store'

gem 'sprockets'

gem_group :development do
  gem 'thin'
  gem 'pry'
  # gem 'pry-debugger'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-coolline'
  gem 'pry-exception_explorer'
  gem 'pry-vterm_aliases'
  gem 'pry-em'
  gem 'pry-theme'
  gem 'pry-macro'
  gem 'pry-inline'
  gem 'pry-nav'
  gem 'pry-doc'
  gem 'pry-git'
  gem 'pry-rails'
  gem 'pry-awesome_print'
  gem 'pry-pretty-numeric'
  gem 'pry-highlight'
  gem 'hirb'
  gem 'meta_request'
end

gem_group :assets do
	gem 'sprockets-es6'
	gem 'lodash-rails'
end

gem_group :test do
	gem 'minitest'
	gem 'mini_backtrace'
	gem 'factory_girl'
	gem 'minitest-reporters'
end

run "bundle install --without nothing"


puts "------------------------------------------------------------------------------------------"
##################################
#          INITIALIZERS          #
##################################
puts "***************** INITIALIZERS *****************"

puts " ----- DECIDE WHETHER TO USE REDIS AS A SESSION STORE (use cookies if not) -----"
def select_redis_port
  counter = 1
  get_port = ->{
  	puts "What port would you like to assign to redis?"
    port = $stdin.gets.to_i
    if port < 1
      return 6379 if counter >= 3
      puts "invalid port - please input an integer above 0"
      counter = counter + 1
      return get_port.call
    end
    port
  }
  get_port.call
end

if yes?("Do you want to use redis?")
	session_store = :redis_session_store
	redis_port = yes?("Would you like to use a custom redis port, or the default 6379?") ? select_redis_port : 6379
	initializer 'redis.rb', <<-CODE
		My::Application.config.session_store :redis_session_store, {
		  key: 'your_session_key',
		  redis: {
		    db: 2,
		    expire_after: 120.minutes,
		    key_prefix: 'myapp:session:',
		    host: 'host', # Redis host name, default is localhost
		    port: 12345   # Redis port, default is 6379
		    serializer: :hybrid
		  }
		}
	CODE
else
	session_store = :cookie_store
end
puts " -------------------------------------------------------------------------------"


puts "------------------------------------------------------------------------------------------"
#######################################
#          ENVIRONMENT SETUP          #
#######################################
puts "***************** ENVIRONMENT SETUP *****************"
environment <<-ENV
	config.time_zone = 'Eastern Time (US & Canada)'
	config.session_store = #{session_store}
	javascript_engine = :js
	config.generators do |g|
	  g.orm :active_record
	  g.test_framework :minitest
	  g.javascript_engine :js
	  g.stylesheet_engine :scss
	end
  console do
    # this block is called only when running console, so we can safely require pry here
    require "pry"
    require 'pry-debugger'
    require 'pry-rails'
    require 'pry-stack_explorer'
    require 'pry-coolline'
    require "pry-exception_explorer"
    require "pry-vterm_aliases"
    require "pry-em"
    require "pry-theme"
    require "pry-macro"
    require "pry-inline"
    require "pry-nav"
    require "pry-doc"
    require "pry-git"
    require "pry-rails"
    require "pry-awesome_print"
    require "pry-pretty-numeric"
    require "pry-highlight"
    require "hirb"
    config.console = Pry
  end
ENV

puts "------------------------------------------------------------------------------------------"
################################
#          RAKE TASKS          #
################################
puts "***************** RAKE TASKS *****************"
rakefile("shell.rake") do
	<<-TASK
		namespace :process do
			desc "Kill all ruby processes"
			task :killall do
				puts "killing all ruby processes"
				run("ps aux | ")
			end
		end
	TASK
end

puts "------------------------------------------------------------------------------------------"
########################################
#          GENERATORS - SETUP          #
########################################
puts "***************** GENERATORS - SETUP *****************"

# generate(:scaffold, "person name:string")
# route "root to: 'people#index'"
rake("db:migrate")
 
after_bundle do
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
  #nodeJS modules ignore
  run "echo 'node_modules' >> .gitignore"
  #install lodash
  run "touch app/assets/javascripts/application.js"
	run "echo '//= require lodash' >> app/assets/javascripts/application.js"
end


puts "------------------------------------------------------------------------------------------"
###########################################
#          BUILD SUBLIME PROJECT          #
###########################################
puts "***************** BUILD SUBLIME PROJECT *****************"
touch ''
run <<-SUBLIMEPROJECT
{
  "folders":
  [
    {
      "path": "/home/andrew/.config/sublime-text-3/Packages/User/snippets"
    },
    {
      "path": "/home/andrew/.config/sublime-text-3/Installed Packages"
    },
    {
      "path": "."
    }
  ]
}

SUBLIMEPROJECT