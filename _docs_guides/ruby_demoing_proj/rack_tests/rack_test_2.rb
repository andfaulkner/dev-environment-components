require 'rack'

def test_method(env)
	[200, {}, ["method called"]]
end

Rack::Handler::Thin.run method(:test_method), :Port => 8081