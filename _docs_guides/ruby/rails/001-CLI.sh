##################################
#       NEW RAILS PROJECT        #
##################################
rails new projname 
# or to use a different database from sqlite3:     rails new --database=postgresql projname
# or to make a new project with specific version rails _3.2.12_ new projname

cd projname

bundle install --binstubs .bundle/bin  # << to allow ruby to act normally with rbenv
rbenv rehash													 # << ...also required for rbenv-friendliness

# if you're using the skylight gem:
skylight disable_dev_warning					  # << prevents this constant annoying error msg in the cli			

# set up rspec to work with app testing
rspec --init

# avoid having the default page always show
mv ./public/index.html ./public/index__old.html

#######################################
#          MAKE A CONTROLLER          #
#######################################
		rails generate controller controller_name action_name

# e.g.
		rails generate controller welcome index
		# ... builds a controller named 'welcome' with an action called 'index'

		# creates a new controller, as:		app/controllers/welcome_controller.rb		[PATHPATH]
		# places an associated route into: 	config/routes.rb							[PATHPATH]
		# creates a new view, as: 			app/views/welcome/index.html.erb			[PATHPATH]

# NOTE: when defining root page, make sure you erase default public/index.html 1st		[PATHPATH]

# e.g. 2:
		rails generate controller StaticPages home help
		# ... builds a controller named 'StaticPages' with actions 'home' and 'help'

##########################################
#          DESTROY A CONTROLLER          #
##########################################
#	Example:
		rails destroy controller StaticPages home help



##################################
#          MAKE A MODEL          #
##################################
### STANDARD MODEL, NO ASSOCIATIONS
# generic:
# 		bin/rails generate model SQLTableName rowName:dataType rowName:dataType [...more rows]
#
#			...where datatype can be:  string, text,
#															   float, integer, decimal,
#															   date, time, datetime, timestamp,
#															   primary_key,
#															   boolean
#			- postgres also allows type array

# example:
		bin/rails generate model Article title:string text:text
# tells Rails we want an Article model w a title attr of type 'string' & a text attr of type 'text'
# those attrs are auto-added to the articles table in the db & mapped to the Article model
# prevents duplicates
# 

### MODEL ASSOCIATED WITH ANOTHER MODEL - I.E. MODEL WITH FOREIGN KEY
# generic:
# 		bin/rails generate model SQLTableName rowName:dataType [...] tableBeingReferenced:references
# example 2:
		bin/rails generate model Comment commenter:string body:text article:references

# creates a "belongs_to" item in models/sqltablename.rb ...or in the example, comment.rb
		# class Comment < ActiveRecord::Base
		#   belongs_to :article
		# end

# DATA TYPES ALLOWED ON A MODEL:

#####################################
#          DESTROY A MODEL          #
#####################################
# Example:
		rails destroy model User

# Clear the entire database
		rake db:drop

#######################################
#          CREATE A SCAFFOLD          #
#######################################
# Scaffold: a full set of functionality for a new data type. Consists of a model,
# 					database migration for that model, controller to manipulate it, views
# 					to view and manipulate the data, and a test suite

# Generate a scaffold

    rails generate scaffold HighScore game:string score:integer



#####################################
#          RUN A MIGRATION          #
#####################################
		bin/rake db:migrate
		# runs rb files in db/migrate/*

#####################################
#          UNDO MIGRATIONS          #
#####################################
	# Undo one migration:
		rake db:rollback

	# Undo all migrations - i.e. reset the database:
		rake db:migrate VERSION=0

	# Undo back to a 10 migrations after the first migration:
		rake db:migrate VERSION=10

	# Clear the entire database
		rake db:drop

#####################################
#         LAUNCH THE SERVER         #
#####################################
		rails server
# In development mode, Rails does not generally require you to restart the server;
# changes you make in files will be automatically picked up by the server


##############################################
#          SEE ALL RACK MIDDLEWARES          #
##############################################
		rake middleware

########################
#         RAKE         #
########################

# list all rake tasks:
		rake -T

#  run the entire Rails app test stack:
		rake test

defn





##################################################
#          MAKE A 2ND CONTROLLER (SAME)          #
##################################################
# generic:
# bin/rails generate controller NameOfController
	# * the name of the controller should be the same as the name of the model...with an 's'

# examples:
		bin/rails generate controller Articles
		bin/rails generate controller Comments