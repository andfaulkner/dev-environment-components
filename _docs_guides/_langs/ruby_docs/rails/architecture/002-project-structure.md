File/Directory		Purpose
==============    =======
app/							Core application (app) code, including models, views, controllers, and helpers
app/assets				Applications assets such as cascading style sheets (CSS), JavaScript files, and images
app/controllers		
app/decorators		
app/helpers				used to extract complex logic out of views. automatically included in views.
app/views					view template files, often *.html.erb. The "view" in MVC.

bin/							Binary executable files

config/						Application configuration
config/routes.rb  app routing config. Defines resources, endpoints of get, post, delete requests, root, etc.
									What controller & action each request ends up at is defined here 

db/								Database files
doc/							Documentation for the application

lib/							Library modules
lib/assets				Library assets such as cascading style sheets (CSS), JavaScript files, and images

log/							Application log files
public/						Data accessible to the public (e.g., via web browsers), such as error pages
bin/rails					A program for generating code, opening console sessions, or starting a local server
test/							Application tests
tmp/							Temporary files

vendor/						Third-party code such as plugins and gems
vendor/assets			Third-party assets such as cascading style sheets (CSS), JavaScript files, and images

README.rdoc				A brief description of the application
Rakefile					Utility tasks available via the rake command
Gemfile						Gem requirements for this app
Gemfile.lock			A list of gems used to ensure that all copies of the app use the same gem versions
config.ru					A configuration file for Rack middleware
.gitignore				Patterns for files that should be ignored by Git

To build this
-------------
rails new name-of-app

scaffolding
-----------
*   example:
    rails generate scaffold User name:string email:string

*   generic:
rails generate scaffold SomeModel dataone:type datatwo:type

* generates an app with the included model

db migration
------------
bundle exec rake db:migrate

*   every time you add a model