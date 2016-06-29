# encoding: utf-8
require 'rake'

def add_gem(gem_name, version = false)
  "gem #{gem_name}#{version ? ', \'version\'' : ''}"
end

def unindent(s)
  s.gsub(/^#{s.scan(/^[ \t]+(?=\S)/).min}/, '')
end

# get name of app
name_index = ARGV.find_index {|item| item.include?('--name') }
PROJECT_NAME = ARGV[name_index.succ]

version_index = ARGV.find_index {|item| item.include?('--version') }
RUBY_VERSION = version_index ? ARGV[version_index.succ] : '2.3.1'

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

# add a few core gems to the bottom of the Gemfile
open('Gemfile', 'a') do |f|
  f.puts unindent(<<-RUBY)
    gem 'devise'

    group :test do
      gem 'rspec'
    end
  RUBY
end

# add environment variable loader to the TOP of the gemfile
# TODO: gem 'dotenv-rails', require: 'dotenv/rails-now'

# create .env file

# give dotenv access to Rake
# add this to top of Rakefile: require 'dotenv/tasks'
