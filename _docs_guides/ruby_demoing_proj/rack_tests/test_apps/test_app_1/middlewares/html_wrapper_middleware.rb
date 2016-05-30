require 'arbre'
require 'rack/request'
require './rack_tests/test_apps/test_app_1/middlewares/middleware_utils/path_helper'
require './rack_tests/test_apps/test_app_1/middlewares/middleware_utils/appender_middleware'

class HTMLWrapperMiddleware < AppenderMiddleware
	include PathHelper

  def append
  	puts get_path
  	if get_path.to_s == '/asdf'
			html = Arbre::Context.new do
				h2 "Hello everyone!"
				ul do
					li "List item one!!"
					li "List item two!"
					li "List item three!"
				end
			end
    elsif get_path.to_s == '/index'
      puts "index!"
      ""
    else
      "nothing"
    end
  end
end
