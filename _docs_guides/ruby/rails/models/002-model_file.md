Model generation result: MODEL FILE
===================================
*   app/models/name_of_model.rb
*   Example model file:

		class User < ActiveRecord::Base
		  attr_accessible :email, :name
		end

				*   Models automatically have all the functionality of the ActiveRecord::Base class (inheritance)
				*   ...meaning User can call all the methods ActiveRecord::Base has, on itself (User.find etc.)

*   attr_accessible 
		*   defines what params can be assigned via mass assignment. E.g.

				@user = User.new(params[:user])

				*   in the above class, only email and name could be assigned this way
				*   otherwise, params would have to be assigned one at a time
				*   generally a poor idea to mass assign variables such as admin status


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
