Console debugger setup
======================
*   install the following gem:
		gem install debugger

*   Add this to the development group in your gemfile:

  	gem 'debugger'

Launch console debugger
-----------------------

*   Insert this line anywhere you want the execution to break:

		debugger

*   When the control flow reaches the debugger statement, execution will pause,
		and the console debugger will open

Running console debugger
------------------------
*   more information:
				help

*   See global variables:

				var global

*   See the content of any variable: e.g.:

				User
				# => User(id: integer, name: string, email: string, created_at: datetime, updated_at: datetime, password_digest: string)

*   View current code you're surrounded with:

				list
					# OR
				list -50
					# OR
				list 10
					# ETC.

*   To continue running the program
				continue
