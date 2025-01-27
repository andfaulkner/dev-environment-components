#template-1.rb

# set correct ruby version
run "rbenv local 2.3.1"


puts "------------------------------------------------------------------------------------------"
#############################
#          HELPERS          #
#############################
puts "***************** HELPERS *****************"

def ask?(question)
  puts question
  $stdin.gets
end

puts " ----- DECIDE WHETHER TO USE REDIS AS A SESSION STORE (use cookies if not) -----"
def select_redis_port
  counter = 1
  get_port = ->{
    puts "What port would you like to assign to redis?"
    port = $stdin.gets.chomp.to_i
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

def select_db
  db_select_counter = 1
  select_db = ->{
    db = ask?("What db would you like to use: Postgres or Mysql/mariadb?")
    if not ['postgres', 'mariadb', 'mysql'].include? db.chomp.downcase
      return 'mysql' if db_select_counter >= 3
      puts "invalid db: #{db} chosen - please choose postgres, mysql, or mariadb"
      db_select_counter = db_select_counter + 1
      return select_db.call
    end
    db.downcase
  }
  select_db.call
end


def prepend_line_to_file(file, text_to_prepend)
  orig_file = file
  temp_file = "#{file}_temp"
  File.open(file, 'w') do |fo|
    fo.puts text_to_prepend
    File.foreach(original_file) do |li|
      fo.puts li
    end
  end
end



kick_it_oldskool = yes?("Do you want to kick it oldskool?")

# defaults
if yes?("Do you want to use a set of sane defaults?")
  use_bootstrap = use_grape = use_rspec = true
  use_redis = use_devise = make_user = !yes?("Would you like a minimal setup?")
  redis_port = 6379 if use_redis
  db = 'mysql'

# custom
else
  use_bootstrap = yes?("Do you want to use bootstrap?")
  use_grape = yes?("Do you want to use grape?")
  (use_redis = yes?("Do you want to use redis?")) unless kick_it_oldskool
  if use_redis
    redis_port ||= yes?("Use a custom redis port or the default of 6379?") ? select_redis_port : 6379
  end
  if (use_devise = yes?("Do you want to use devise?"))
    make_user = yes?("Create a default device model named User?")
  end
  use_rspec = yes?("Do you want to use rspec?")
end

db = select_db
# ask?("Would you like to use postgres or mysql/mariadb?")
puts "\n\n *******************************"
puts "db selected:::   #{db}"
puts "use_bootstrap:::   #{use_bootstrap}"
puts "use_redis:::   #{use_redis}"
puts "use_grape:::   #{use_grape}"
puts "use_rspec:::   #{use_rspec}"
puts "use_devise:::   #{use_devise}"
puts " *******************************\n\n\n"

puts "------------------------------------------------------------------------------------------"
##################################
#          INSTALL GEMS          #
##################################
puts "***************** INSTALL GEMS *****************"

if kick_it_oldskool
  gem 'rails', '3.2.12'
else
  gem 'rails'
end

# REST API GEMS
if use_grape
  gem 'rabl'
  gem 'grape'
  gem 'hashie-forbidden_attributes'
  gem 'grape-entity'
end

# AUTH GEMS
gem 'warden-oauth2'
gem 'oauth2'
gem 'cancan'
gem 'devise' if use_devise
gem 'bcrypt'

#FRONTEND GEMS
gem 'sass-rails'
gem 'bootstrap-sass' if use_bootstrap
gem 'compass-rails'
gem 'jquery-turbolinks'
gem 'sprockets'
gem 'draper'

## DB GEMS
puts db
if db.chomp == 'postgres' || db.chomp == 'pg'
  puts '\n\n**installing postgres **\n\n'
  gem 'pg'
elsif kick_it_oldskool
  puts '\n\n**installing mysql2 **\n\n'
  gem 'mysql2', '>= 0.3.13'
else
  puts '\n\n**installing mysql2 **\n\n'
  gem 'mysql2'
end
gem 'redis-session-store' if use_redis
gem 'squeel'
gem "audited-activerecord"
gem 'foreigner'
gem 'activerecord-import'
gem 'delayed_job_active_record'

# OTHER GEMS
gem 'skylight'
gem 'roo'
gem 'ice_cube'
gem 'delayed_job'
gem 'rails_12factor'
gem 'os'

# for use with grape


gem_group :development do
  gem 'thin'

  gem 'pry'
  gem 'pry-debugger' if kick_it_oldskool
  gem 'pry-byebug' unless kick_it_oldskool
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-coolline'
  gem 'pry-em' unless kick_it_oldskool
  gem 'pry-theme'
  gem 'pry-macro'
  gem 'pry-inline' unless kick_it_oldskool
  gem 'pry-git' unless kick_it_oldskool
  gem 'pry-rails'
  gem 'pry-awesome_print'
  gem 'pry-pretty-numeric'
  gem 'hirb'

  gem 'meta_request'
  gem 'better_errors'

  gem 'rubocop'
  gem 'capistrano-rails'
  gem 'fivemat'
  gem 'quiet_assets'
end

gem_group :assets do
	gem 'sprockets-es6' unless kick_it_oldskool
end

gem_group :test, :development do
	# gem 'minitest'
	# gem 'mini_backtrace'
	gem 'factory_girl' if use_rspec
	# gem 'minitest-reporters'
  gem 'factory_girl_rails' if use_rspec
  gem 'rspec' if use_rspec
  gem 'rspec-rails' if use_rspec
end

run "bundle install"


puts "------------------------------------------------------------------------------------------"
##################################
#          INITIALIZERS          #
##################################
puts "***************** INITIALIZERS *****************"

if use_redis
	session_store = :redis_session_store
	# if redis_port
 #    redis_port = select_redis_port
 #  else
 #    redis_port = 6379
 #  end
# 	initializer 'redis.rb', <<-CODE
# 		My::Application.config.session_store :redis_session_store, {
# 		  key: 'your_session_key',
# 		  redis: {
# 		    db: 2,
# 		    expire_after: 120.minutes,
# 		    key_prefix: 'myapp:session:',
# 		    host: 'host', # Redis host name, default is localhost
# 		    port: 12345   # Redis port, default is 6379
# 		    serializer: :hybrid
# 		  }
# 		}
# 	CODE
else
  session_store = :cookie_store
end
puts " -------------------------------------------------------------------------------"


puts "------------------------------------------------------------------------------------------"
#######################################
#          ENVIRONMENT SETUP          #
#######################################
if not kick_it_oldskool
  puts "***************** ENVIRONMENT SETUP *****************"
  environment <<-ENV
  	config.time_zone = 'Eastern Time (US & Canada)'
  	javascript_engine = :js
  	config.generators do |g|
  	  g.orm :active_record
  	  g.test_framework :rspec
  	  g.javascript_engine :js
  	  g.stylesheet_engine :scss
  	end
    console do
      # this block is called only when running console, so we can safely require pry here
      gem 'pry'
      gem 'pry-byebug'
      gem 'pry-rails'
      gem 'pry-stack_explorer'
      gem 'pry-coolline'
      gem 'pry-em'
      gem 'pry-theme'
      gem 'pry-macro'
      gem 'pry-inline'
      gem 'pry-git'
      gem 'pry-rails'
      gem 'pry-awesome_print'
      gem 'pry-pretty-numeric'
      gem 'hirb'
      config.console = Pry
    end
  ENV
end

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
###########################################
#          BUILD SUBLIME PROJECT          #
###########################################
puts "***************** BUILD SUBLIME PROJECT *****************"
run <<-SUBLIMEPROJECT
echo '{
  "folders":
  [
    {
      "path": "/home/andrew/.config/sublime-text-3/Packages/User/snippets"
    },
    {
      "path": "."
    }
  ]
}' >> #{@app_name}.sublime-project
SUBLIMEPROJECT


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
  # ignore unwanted items for git
  `echo 'node_modules' >> .gitignore`
  `echo 'local_notes' >> .gitignore`
  #install lodash
  # `mkdir app/assets/javascripts`
  `touch 'app/assets/javascripts/application.js'`
  # TODO: auto-reorder this
	`echo "//= require lodash" >> app/assets/javascripts/application.js`
  `echo "//= require jquery.turbolinks" >> app/assets/javascripts/application.js`
  if use_bootstrap
    `echo "//= require bootstrap/dropdown" >> app/assets/javascripts/application.js`
  end

  puts "------------------------------------------------------------------------------------------"
  ###################################
  #          INSTALLATIONS          #
  ###################################
  puts "***************** INSTALLATIONS *****************"

  # INJECT LINES INTO FILES
  # insert default urls for mailer
  `sed -i "3 i\\\n\\ \\ config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }" config/environments/test.rb`
  `sed -i "3 i\\\n\\ \\ config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }" config/environments/development.rb`
  `sed -i "4 i\\\n\\ \\ config.action_mailer.perform_deliveries = true" config/environments/development.rb`
  `sed -i "5 i\\\n\\ \\ config.action_mailer.delivery_method = :sendmail" config/environments/development.rb`

  # RUN THESE AFTERWARDS:
  # cd ${@app_name}
  # bin/rails generate rspec:install
  # add squeel
  # bin/rails generate squeel:initializer
  # install devise
  # bin/rails generate devise:install

  # ADD THESE TO application.rb if using grape:
  # config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
  # config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
end

puts " ----- RSPEC? -----"
if use_rspec
  run "bundle exec bin/rails generate rspec:install"
end

puts " ----- DEVISE -----"
if use_devise
  run "bundle exec bin/rails generate devise:install"
  if make_user 
    run 'bundle exec bin/rails generate devise User'
  end
end

run "mkdir doc"


puts "------------------------------------------------------------------------------------------"
#############################
#          RUBOCOP          #
#############################
puts "***************** RUBOCOP *****************"
`touch .rubocop.yml`
run <<-RUBOCOP
echo "AllCops:
  Include:
    - '**/Rakefile'
    - '**/config.ru'
    - 'app/**/*.rb'
  Exclude:
    - 'db/**/*'
    - 'config/**/*'
    - 'script/**/*'
    - 'doc/**/*'
    - 'log/**/*'
    - '.gitignore'
    - '.babelrc'
    - '*.sublime-*'
    - '*.sh'
    - '*.md'
    - '*.txt'
    - 'package.json'
    - 'node_modules/**/*'
    - '**/node_modules/**/*'
    - '.bundle/**/*'
    - 'bin/setup'
    - 'bin/rails'
    - 'bin/rake'
    - 'bin/spring'
    - 'bin/bundle'
    - 'test/**/*'

Metrics/LineLength:
  Max: 100

Style/Encoding:
  Enabled: false

Style/StringLiterals:
  Enabled: false

Style/BlockComments:
  Enabled: false

DefaultFormatter: progress" >> .rubocop.yml
RUBOCOP

## PULL SCRIPTS IN FROM WEB
`mkdir app/assets/vendor/`
`wget https://github.com/twbs/bootstrap/releases/download/v3.3.6/bootstrap-3.3.6-dist.zip`
`unzip bootstrap-3.3.6-dist.zip -d app/assets/vendor/`
`rm bootstrap-3.3.6-dist.zip`
`mv app/assets/vendor/bootstrap-3.3.6-dist app/assets/vendor/bootstrap`
`wget https://raw.githubusercontent.com/lodash/lodash/4.13.1/dist/lodash.min.js`
`mv lodash.min.js app/assets/vendor/`



#   session_store = :redis_session_store
#   redis_port = yes?("Would you like to use a custom redis port, or the default 6379?") ? select_redis_port : 6379
#   initializer 'redis.rb', <<-CODE
#     My::Application.config.session_store :redis_session_store, {
#       key: 'your_session_key',
#       redis: {
#         db: 2,
#         expire_after: 120.minutes,
#         key_prefix: 'myapp:session:',
#         host: 'host', # Redis host name, default is localhost
#         port: 12345   # Redis port, default is 6379
#         serializer: :hybrid
#       }
#     }
#   CODE
# # else
#   # session_store = :cookie_store
# end
