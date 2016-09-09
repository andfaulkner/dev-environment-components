require 'pry'
require 'hirb'

puts "------------------------------------------------------------------------------------------"
##################################
#          method_added          #
##################################
puts "***************** Method_added *****************"
class Den
	def self.method_added(method_name)
		puts "#{method_name} was added to #{self}"
	end
	def brown_bear name
		p (@brown_bears ||= []) << name
	end
	# => brown_bear was added to den!
end

den = Den.new
den.brown_bear "pooh"
den.brown_bear "meeka_as_a_bear"

class Den
	def black_bear name
		p (@black_bears ||= []) << name
	end
end # => black_bear was added to Den

den.black_bear "some black bear named bear"

binding.pry

# Den.mate
# Den.binding_n
# Den.capture
# Den.cattr_accessor
# Den.cattr_reader
# Den.cattr_writer
# Den.class_attribute
# Den.choose
# Den.class_eval
# Den.class_exec
# Den.debug_method
# Den.autoload
# Den.autoload?
# Den.enum_for
# Den.delegate
# Den.display
# Den.in?
# Den.initialize_clone
# Den.initialize_dup
# Den.mattr_accessor
# Den.mattr_reader
# Den.mattr_writer
# Den.module_eval
# Den.module_exec
# Den.instance_eval
# Den.instance_exec
# Den.post_mortem_method
# Den.namespace_name
# Den.or_ask
# Den.object_id
# Den.public_class_method
# Den.public_constant
# Den.public_instance_method
# Den.public_instance_methods
# Den.public_method
# Den.public_send
# Den.quietly
# Den.redefine_method
# Den.remove_class_variable
# Den.remove_possible_method
# Den.say
# Den.send
# Den.silence
# Den.singleton_class
# Den.singleton_methods
# Den.tap
