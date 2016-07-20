import "#{File.dirname(__FILE__)}/rake-helpers.rb"

# ########### setup -- only do once ###########
# npm install -g avn avn-nvm avn-n
# avn setup
# brew install nvm
# echo '  export NVM_DIR="$HOME/.nvm"
#  . "$(brew --prefix nvm)/nvm.sh"'
# nvm install v6.3.0
# echo "nvm use v6.3.0" >> .bash_profile
# npm install -g gulp webpack mimosa grunt
#############################################
desc 'things'
task :asdf, [:myarg] do |_t, args|
  puts args[:myarg]
end

class BuildRails
  def initialize(version: 'v6.3.0', )
    #initialization code, run once on first call to BuildRails.instance. Takes no arguments.
  end
end

def node_setup(version = '6.3.0')
  puts 'node_setup'
  sh("nvm use --delete-prefix #{version}")
  %x(touch .node-version)
  %x(touch .nvmrc)
  %x(echo 'v#{version}' > .node-version)
  %x(echo '#{version}' > .nvmrc)
end

desc 'setup rails 5 project with reactjs, bootstrap, jquery, redux, devise, drape, delayed_job, and a set of sane defaults'
task :rails_setup_1, [:project_name, :node_version] do |_t, args|
  args[:node_version] ||= 'v6.3.0'
  BuildRails.new('v6.3.0')
  puts %x(~/.nvm/nvm.sh)
  # new rails project
  %x(rails new --database=postgresql #{args[:project_name]})
  puts 'new rails project done!'
  
  Dir.chdir("#{args[:project_name]}")
  puts 'in project folder!'

  `bundle install`
  puts `which nvm`
  puts 'first bundle install done!'
  # construct a db
  # `createdb #{args[:project_name]}_development`
  puts 'db created!'
  `rails db:migrate`
  `rails db:setup`
  puts 'rails db set up!'

  node_setup(args[:node_version])

  `touch test.test`
  puts 'testfile done!'
  `cat << 'EOF' >> test.test
  @import "bootstrap-sprockets";
  @import "bootstrap";
  @import "bootstrap/theme";
  EOF`
end

# IF DOING REACT-ON-RAILS
# install react_on_rails first
# inject_at_match.rb --before Gemfile "^# Use jquery as the JavaScript library" "gem 'react_on_rails', '~> 5'"
# bundle install
# rails generate react_on_rails:install

# # bring in simple_form with bootstrap
# `rails generate simple_form:install --bootstrap`

# ######## load in bootstrap for styling ########
# `touch app/assets/stylesheets/application.scss`
# `cat << 'EOF' >> app/assets/stylesheets/application.scss
# @import "bootstrap-sprockets";
# @import "bootstrap";
# @import "bootstrap/theme";
# EOF`

# `cat << 'EOF' >> app/assets/stylesheets/home.scss
# @import "bootstrap-sprockets";
# @import "bootstrap";
# @import "bootstrap/theme";
# EOF`


# ######## application.html.erb groundwork - give it new content ########
# `rm app/views/layouts/application.html.erb`
# `cat << 'EOF' >> app/views/layouts/application.html.erb
# <!DOCTYPE html>
# <html>
#   <head>
#     <title>TextAdventureGame1</title>
#     <%= csrf_meta_tags %>

#     <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
#     <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
#   </head>

#   <body>
#     <div class="container">
#       <% flash.each do |key, value| %>
#         <div class="alert alert-<%= key %>">
#           <%= value %>
#         </div>
#       <% end %>
#     </div>

#     <%= yield :top_content %>

#     <div class="container">
#         <h1><%= yield :header %></h1>
#       <%= yield %>
#     </div>
#   </body>
# </html>
# EOF`


# ######## Basic helper to render the app header ######## 
# `rm app/helpers/application_helper.rb`
# `cat << 'EOF' >> app/helpers/application_helper.rb`
# module ApplicationHelper
#   def header(text)
#     content_for(:header) { text.to_s }
#   end
# end
# EOF

# ######## Basic re-route of application root ######## 
# rm config/routes.rb
# cat << 'EOF' >> config/routes.rb
# Rails.application.routes.draw do
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   root to: 'home#index'
# end
# EOF

# ################################ DEVISE ################################
# ## Install devise
# rails generate devise:install

# # provide default url for action mailer
# inject_at_match.rb --before config/environments/development.rb "^[^a-zA-Z0-9@#]+config\.action_mailer\.perform_caching = " "  config.action_mailer.default_url_options = { host: '127.0.0.1', port: 3000 }
# "

# inject_at_match.rb --before Gemfile "^# Use jquery as the JavaScript library" "gem 'react_on_rails', '~> 5'"

# ## Create user model for devise
# rails generate devise User

# ## allow user to provide their name as an option 
# inject_at_match.rb --before db/migrate/*_devise_create_users.rb "^[^a-zA-Z0-9#]+t\.timestamps null: " "      t.string  :name
# "

# rake db:migrate

# # Generate the devise views
# rails generate devise:views

# # live reloading!
# guard init livereload

# ## # inject livereload middleware hook into config/environments/development.rb
# ## inject_at_match.rb --after config/environments/development.rb "^[^a-zA-Z0-9]+config\.file_watcher = ActiveSupport::EventedFileUpdateChecker" "
# ##   # Inject middleware for live reloading pages in browser into rack stack
# ##   config.middleware.insert_before ActionDispatch::Static, Rack::LiveReload"

# # set up application_controller to allow creation of users that have a username
# rm app/controllers/application_controller.rb
# cat << 'EOF' >> app/controllers/application_controller.rb
# class ApplicationController < ActionController::Base
#   protect_from_forgery with: :exception

#   before_filter :configure_permitted_parameters, if: :devise_controller?

#   protected

#     def configure_permitted_parameters
#       devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :username])
#       devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :username])
#     end
# end
# EOF

# # reactJS
# rails g react:install

# mkdir app/assets/javascripts/components
# touch app/assets/javascripts/components/components.js
# end
