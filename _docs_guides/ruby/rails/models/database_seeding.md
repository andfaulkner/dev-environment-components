Seeding
=======
*   Feeding default values to a database, via a seed file containing initial info
*   Basically "bootstrapping"
*   Seed data is defined in the seed file (db/seeds.rb). Seed operation runs from the CLI	 [[PATH]]

Seed operation in the CLI
-------------------------
		rake db:seed

    *   runs the seed operation, running db/seeds.rb & persisting data changes into the db
   

Seed file (db/seeds.rb)
-----------------------
*   data within is akin to what you would input into the rails console when testing your app
    *   it's just ruby code in the file - no (major) special magic

*   create instances of models here & save them. method 'create' both makes & saves, but if you use
	  'new', you'll then have to call 'save' on the created instance (remember: instances are rows)

*   example seed (of which there would be many in a full seedfile):

            User.create :name => "Meeka Faulkner",   :email => "meekafaulkner@gmail.com",
                        :password => "10qpalwsoldk", :password_confirmation => "10qpalwsoldk"

    *   key value pairs passed to User.create: key is the column name, value is the data value

    *   make a new db row using new (rather than create):

    		    callie = User.new :name => "Callie",   :email => "callie@callie.com",
                     :password => "woofwoof", :password_confirmation => "woofwoof"

            callie.save
