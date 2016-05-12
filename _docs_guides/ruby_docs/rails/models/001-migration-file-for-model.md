Model generation result:: MIGRATION FILE
========================================
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
