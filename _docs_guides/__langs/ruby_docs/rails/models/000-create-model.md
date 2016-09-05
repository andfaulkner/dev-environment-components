# Generating models

Syntax
======

		rails generate model NameOfModel column1:type column2:type ... column_n:type

		*   example:

				rails generate model User name:string email:string

				*  this creates a "users" table in the db, with 2 columns: name & email

*   Several files result from generating a model: 
		*   a migration file
		*   the model file itself
		*   2 test files:
			*   test/unit/nameofmodel_test.rb 																									 [[PATH]]
			*   test/fixtures/nameofmodel.yml 																									 [[PATH]]


Create a row in a model in the rails console
============================================
*   example

    User.create(name: "Meeka Faulkner",
    						email: "meekafaulkner@gmail.com",
    						password: "imabigmoo",
    						password_confirmation: "imabigmoo")

        *   above example assumes model has columns name & email, & contains has_secure_password

