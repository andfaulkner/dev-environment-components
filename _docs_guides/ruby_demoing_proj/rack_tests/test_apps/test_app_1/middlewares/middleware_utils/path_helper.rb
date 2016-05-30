require 'rack/request'

module PathHelper
	module ClassMethods
	end
	
	module InstanceMethods
	  def get_path
	  	req = Rack::Request.new(@env)
	  	puts "Current path is: #{req.path}"
	  	req.path
	  end
	end
	
	def self.included(receiver)
		receiver.extend         ClassMethods
		receiver.send :include, InstanceMethods
	end
end