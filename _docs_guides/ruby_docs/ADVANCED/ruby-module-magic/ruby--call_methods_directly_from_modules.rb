#!/usr/bin/env ruby

module SomeModule
	def hello
		puts "hello all!"
	end
	module_function :hello
end

puts SomeModule.hello # => hello all!



puts "------------------------------------------------------------------------------------------"
####################################################
#          CALL NESTED MODULES' FUNCTIONS          #
####################################################
puts "***************** CALL NESTED MODULES' FUNCTIONS *****************"
module TopLevelModule
	module MidLevelModule
		def goodbye
			puts "goodbye people!"
		end
		module_function :goodbye

		# another way to define module functions
		module_function def seeya
			puts "see ya, wouldn't wanna be ya"
		end
	end
end

TopLevelModule::MidLevelModule.goodbye # => goodbye people!
TopLevelModule::MidLevelModule.seeya # => see ya, wouldn't wanna be ya!
