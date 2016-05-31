require 'rack'

my_rack_proc = lambda {|env| [
	200, 
	{ "Content-Type" => "text/plain" },
	["Hello. The time is #{Time.now}"]
]}

Rack::Handler::Thin.run my_rack_proc, :Port => 8081
