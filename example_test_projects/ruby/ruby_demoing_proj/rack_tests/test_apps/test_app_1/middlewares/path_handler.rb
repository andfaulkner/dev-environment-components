require 'rack/request'
require './rack_tests/test_apps/test_app_1/middlewares/middleware_utils/path_helper'

class PathHandler #< RootMiddleware
	include PathHelper

  def initialize appl
    @appl = appl
  end

  # Do the actual action
  def modify_response body
    new_body = ""
    body.each { |string| new_body << " " << string }
    new_body << "<br>Path is #{get_path}"
  end

  # call the inner application & return it
  def call env
  	@env = env
    status, headers, body = @appl.call env
    new_body = modify_response body
    [status, headers, [new_body]]
  end
end