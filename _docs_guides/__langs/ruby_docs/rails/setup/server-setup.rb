##################################### Install new server gem #####################################

# PASSENGER
## add to Gemfile:
gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"
## CLI
gem install passenger
bundle install

# PUMA 				<<<<<
## add to Gemfile:
gem "puma", ">= 3.4.0"
## CLI
gem install puma
bundle install

#Run a Rails eb server
rails server puma
	# OR
rails server passenger
	# OR

# -- defaults to WEBrick

################################### Boilerplate config of puma ###################################
# in config/puma/rb:

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/
  # deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end
