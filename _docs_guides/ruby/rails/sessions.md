session method on ActionController::Base
========================================
*   Accessible in helpers, controllers

##log in / create a session with session method
*   example:
				session[:person] = Person.authenticate(user_name, password)
						*   ...where Person is the name of a model
						*   this logs a person in

##log out / end a session with session method
*   example:
		    session.delete(:user_id)


#some_user.authenticate method -- on ActiveModel
================================================
*   Made available by adding has_secure_password to a model e.g.

				class User < ActiveRecord::Base
				  attr_accessible 	:email, :name, :password, :password_confirmation, :poo
				  has_secure_password
				end

*   Accessible in helpers, controllers once has_secure_password is added to the model
*   Runs on a model
*   determines if a given password is valid for a particular user by computing its digest
		and comparing the result to password_digest in the database for that model
*   Example:
				user.authenticate("foobar") 		# if foobar is the password, will return the user
																				# if foobar is note the password, will return false

				*   ...where user is an instance of a model, acquired by e.g.:
								user = User.find_by(email: "meeka@example.com")
