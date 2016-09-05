# encoding: utf-8

# intended to handle chores to complete immediately after creating a new rails project

require 'rake'

def add_gem(gem_name, version = false)
  "gem #{gem_name}#{version ? ', \'version\'' : ''}"
end

def unindent(s)
  s.gsub(/^#{s.scan(/^[ \t]+(?=\S)/).min}/, '')
end

# get name of app
name_index = ARGV.find_index {|item| item.include?('--name') }
puts name_index
if name_index != nil
  PROJECT_NAME = ARGV[(name_index ||= 0).succ] 
end

# start a pg db
sh 'pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

begin
  # create a pg db for project
  sh "createdb #{PROJECT_NAME}_development"
rescue
  puts 'db creation failed, db likely already exists'
end

# add ruby version setter
sh "echo \"#{RUBY_VERSION}\" > .ruby-version" # e.g. 2.3.1

desc 'Inject list of commonly-needed gems for Rails projects into the gemfile, & install'
task :load_all do
  # add a few core gems
  open('Gemfile', 'a') do |f|
    f.puts unindent(<<-RUBY)

      gem 'simple_form'

      # authentication and permissions gems
      gem 'devise'
      gem 'cancancan', '~> 1.10'

      # asynchronously execute longer tasks in the background
      gem 'delayed_job_active_record'

      group :test do
      end

      group :test, :development do
        gem 'rspec-rails'
        gem 'factory_girl_rails'

        # debugging
        gem 'pry'
        gem 'pry-rails'
        gem 'pry-coolline'
        gem 'pry-stack_explorer'
        gem 'pry-inline'

        # pretty-printing
        gem 'awesome_print'
        gem 'hirb'
      end

      group :development do
        gem 'rubocop'
        gem 'better_errors', '2.1.1'
      end

    RUBY
  end
  sh "bundle install"
end

# install rspec into project. Create spec dir & initialize it (creates helpers & config files)
sh "rails generate rspec:install"

# create base Ability class for project (via cancancan's generator)
sh "rails g cancan:ability"

# binstub for rspec, make it runnable via bin/rspec
sh "bundle binstubs rspec-core"


# define a cancancan ability?
# e.g.  rails g cancan:ability
