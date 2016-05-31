require 'rack'
require "better_errors"

def app_require path
	root_path = './rack_tests/test_apps/test_app_1/'
	if path.include?("middlewares/")
		puts "* #{path.gsub(/^middlewares\//, "")}"
	end
	require "#{root_path}/#{path}".squeeze("/")
end

puts "\nMiddlewares loaded:"
app_require "test_app_1.rb"
app_require "middlewares/greetings_middleware.rb"
app_require "middlewares/path_handler.rb"
app_require "middlewares/html_wrapper_middleware.rb"
puts "******************"

############################## MONKEY-PATCH ##############################
# def use_orig_wrapper(middleware)
# 	uses = (method :use).clone
# 	lambda { |middleware| uses middleware }
# end

# def use(middleware)
# 	puts middleware
# 	use_orig_wrapper(middleware).call(middleware)
# end
############################ END MONKEY PATCH ############################

use Rack::Reloader

# included a plugin!
use BetterErrors::Middleware
BetterErrors.application_root = __dir__

# display path
use PathHandler

use GreetingsMiddleware
use HTMLWrapperMiddleware

# respond to request
run MyApp.new
