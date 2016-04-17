# Generating models

Syntax
======

		rails generate model NameOfModel column1:type column2:type ... column_n:type

		*   example:

				rails generate model User name:string email:string

				*  this creates a "users" table in the db, with 2 columns: name & email

*   Several files result from generating a model: a migration file, 2 types of
    tests, and the model file itself


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

ModelGenResult:: MIGRATION FILE
===============================
*   migrations provides a way to incrementally alter the structure of the db

*   this is found in db/migration/[timestamp]_create_nameofmodel.rb 											 [[PATH]]
		*    why a timestamp? To prevent migration file title conflicts.

*   To run all migrations:

				bundle exec rake db:migrate

		*   After running a migration, the new table can be seen in the database

### Example migration file
		class CreateUsers < ActiveRecord::Migration
		  def change
		    create_table :users do |t|
		      t.string :name
		      t.string :email

		      t.timestamps null: false
		    end
		  end
		end

*   class CreateModelnms:  where Modelnms in class name must be the model name plus 's' ('Users')
*   change: 						   contents determine changes to be made to the db
*   create_table:				   creates table in db, by accepting a block with a 'table' param (t)
		**  create_table block:
				*** t.string :columnname      -  creates a column of type string, called columnname
				*** t.timestamps null: false  -  creates 2 datetime columns: created_at & updated_at


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

ModelGenResult:: MODEL FILE
===========================
*   app/models/name_of_model.rb
*   Example model file:

		class User < ActiveRecord::Base
		  attr_accessible :email, :name
		end

*   Models automatically have all the functionality of the ActiveRecord::Base class (inheritance)
*   ...meaning User can call all the methods ActiveRecord::Base has, on itself (User.find etc.)

--------------------------------------------------------------------------------

Model class / ActiveRecord::Base methods
----------------------------------------
*   the class of the specific model (in the previous example "class User") inherits all methods
    from ActiveRecord::Base
*   this provides the model w/ the ability to create, modify, destroy, & inspect data from its
		associated database table - e.g. SQL table users for class Users

### create, save, & modify rows (data)  --  ActiveRecord::Base methods 
*   user = User.new(hash_data)  - create new row in Users table. receives a hash, where each key
																	corresponds to a column name. e.g.:
																			user = User.new("k1"=>"v1", "k2"=>"v2", "etc"=>"etcetc")
																	Note that it isn't saved until the save method is called. It
																	creates a "virtual" record initially for local editing.

*   user.save           				- save the row you've created to the database

*  	user.col_name_here = 'val'	- alter the value in a column for a specific row. col_name_here is
																	the name of the col to alter, 'val' is what it's changing to.
																	This will update the updated_at column

*   user.update_attributes(arg) - accepts hash of attributes. If successful, updates & saves data
																	in 1 step. E.g.
																			user.update_attributes(name: "Dude", email: "dude@abides.me")
																	Note that if any validation fails, the whole call fails.

*   user.update_attribute(arg) -  identical to update_attributes, but only accepts 1 argument. e.g.
																			 user.update_attribute(:name, "The Dude")

----
### metadata (data about the table, rows, cols)  --  ActiveRecord::Base methods
*		User.column_names 					- return names of all columns defined on the model
*		User.exists?(0)							- does a user with id=0 exist?
*		User.count 									- how many rows are there in the users table? Returns an integer
*   User.table_name 						- get name of table associated w the model. Usually model name + s.
																	e.g. User.table_name      # => "users"

----
### delete data  --  ActiveRecord::Base methods
*		User.delete(1) 							- delete row with id=1
*		User.delete_all 						- delete every single data item in the table

----
### select rows  --  ActiveRecord::Base methods
*   User.find(2)								- return 3rd user saved in the db. param is the row id
*   User.limit(5)								- pull 1st 5 records out of db. Performant: limit done on SQL end.
*		User.where("col == 'val'")	- find all rows where column col has value 'val'. e.g.
																			User.where("name == 'meeka'")
*   User.first 									- select the first user, that's it

----
### select columns  --  ActiveRecord::Base methods
*   User.select("col1")  				- FAST. Only return specified col, in original Model obj. Example:
																		Query::  			User.select("name"):
																		Return data:: [#<User name: "callie">, #<User name: "meeka">]
*   User.select("col1,c2,etc")  - FAST. only return specified columns. Same as select w 1 col, but
																	 the returned model object has more than 1 col of data in it.
*   User.pluck("col") 				  - return specified columns

----
### Dangerous ActiveRecord::Base methods - returns big piles in one go, often too slow
*   User.find(:all)							- ***PERFORMANCE HAZARD*** return all rows saved in users table
																	 (excludes unsaved WIP rows)
*   User.all 										- ***PERFORMANCE HAZARD*** return all rows in user table.
*   User.select{|row| ... }			- ????? ***PERFORMANCE HAZARD*** select rows where block ret true
*   User.order("RAND()")				- ***PERFORMANCE HAZARD*** ret all rows, in random order.
																   NOTE: that syntax is MySQL. For Postgres: User.order("RANDOM()")

### MORE: examine later 		# << TODO 	--	 ActiveRecord::Base methods
*   User.find_by_sql
*		User.find_each
*		User.find_in_batches
*		User.count_by_sql
*		User.columns
*		User.columns_hash
*		User.clone
*		User.equal?
*		User.dup
*		User.enum_for
*		...etc...

----
###### WARNING: DO NOT RETURN THE ENTIRE TABLE!!!
*   Don't do things like this:
				User.find(:all)  									# OR...
				User.all.each do |user| ... end

*   These returns the entire contents of the table, at which point extraction of relevant
		data is done entirely in Ruby. Very, very, very slow, and it doesn't scale at all.

--------------------------------------------------------------------------------

Model file validation
---------------------
*   done on individual rows to make sure they meet all requirements to be acceptable data
		*   determines whether to allow a row into the database

*   validations are set up in model files (app/models/modelnm.rb e.g. app/models/users.rb) [[PATH]]
*   example:
				class User < ActiveRecord::Base
				  attr_accessible :email, :name
				  validates :name, presence: true  # << this is a validation line
				end

#### Presence validations
    validates :colname, presence: true

*    checks to ensure the column actually has data in it

--------------------------------------------------------------------------------

Migration to add structure to existing model
--------------------------------------------
*   CLI command:
		    rails generate migration name_of_migration_goes_here
		    # OR
		    rails generate migration name_of_migration_goes_here col_name:type
		    *   where type must be string, integer, date, etc.

*   result goes in db/migration/[timestamp]_name_of_migration_goes_here.rb 								 [[PATH]]

*   example migration given by generic example command:

				class NameOfMigrationGoesHere < ActiveRecord::Migration
				  def change
				  end
				end

### Add an index to a migration
*   example (in class NameOfMigrationGoesHere - as referenced above)
			def change
				add_index :users, :email, unique: true
			end

	  *   add_index - adds an index on the email column of the users table
	  		*   unique: true 	- enforces uniqueness on the new index

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

ModelGenResult:: MODEL TESTS
============================
*   test/unit/nameofmodel_test.rb 																												 [[PATH]]
*   test/fixtures/nameofmodel.yml 																												 [[PATH]]


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
Add password magic to a model
=============================
*   do a special migration - a field called password_digest is required for password magic:
		
		rails generate migration add_password_digest_to_users password_digest:string

*   add this to the bottom of the model (e.g. app/models/user.rb) you want to store a password in:

		has_secure_password

*   what this provides you:

		*   The ability to save a securely hashed password_digest attribute to the database
		*   2 virtual attributes: password & password_confirmation; along w/ presence validations
		    upon object creation, & a validation requiring that they match
		*   An authenticate method that returns the user when password is correct (& false otherwise)

*   add bcrypt to the project Gemfile:

		gem 'bcrypt', '3.1.7'
		gem 'bcrypt-ruby', '~> 3.0.0'

		*   ...then 'bundle install' on the cli
		*   ...or if that doesn't work:   'bundle update bcrypt'   THEN   'bundle install'

*  add :password, :password_confirmation to attr_accessible list in model. e.g.

	  attr_accessible 	:email, :name, :password, :password_confirmation

*   make sure devise isn't install. Remove it from Gemfile if so...unless you're using it to
    handle passwords, in which case this whole procedure is not relevant

##user.authenticate
*   takes 1 argument: a password
*   if the password matches the hash stored in the db (after conversion), returns the user
		*   otherwise, returns false
*   auto-added to any model with has_secure_password defined on it

Create a model in the rails console
===================================

*   example

    User.create(name: "Meeka Faulkner",
    						email: "meekafaulkner@gmail.com",
    						password: "imabigmoo",
    						password_confirmation: "imabigmoo")

        *   above example assumes model has columns name & email, & contains has_secure_password

