
# There are 3 built-in environments:
# 	development				<<<< default
# 	test
# 	production

puts "------------------------------------------------------------------------------------------"
###################################################
#          SEE CURRENT RAILS ENVIRONMENT          #
###################################################
puts "***************** SEE CURRENT RAILS ENVIRONMENT *****************"

puts " ----- get current environment as a string -----"
puts Rails.env
# => "development"

puts " ----- Ask if current environment is development, or test, or production -----"
puts Rails.env.development?
puts Rails.env.test?
puts Rails.env.production?



puts "------------------------------------------------------------------------------------------"
################################################################
#          RUN RAILS SERVER IN DIFFERENT ENVIRONMENTS          #
################################################################
puts "***************** RUN RAILS SERVER IN DIFFERENT ENVIRONMENTS *****************"
#   Server runs in development mode by default.
#   To run in production:
#   
#       you'll need to build the production database first, which is done as follows:
#   				bundle exec rake db:migrate RAILS_ENV=production
#   		Run the server for production using:
#   			rails server --environment production
#   			



puts "------------------------------------------------------------------------------------------"
################################################################
#          RUN RAILS CONSOLE IN DIFFERENT ENVIRONMENTS          #
################################################################
puts "***************** RUN RAILS CONSOLE IN DIFFERENT ENVIRONMENTS *****************"
#   Console runs in development mode by default.
#   To run console in test environment:
#   		rails console test
