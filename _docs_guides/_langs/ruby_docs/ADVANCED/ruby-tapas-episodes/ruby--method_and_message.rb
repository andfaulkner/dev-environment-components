#!/usr/bin/env ruby


# message: name for responsibility an object may have
# method: name, concrete piece of code that encodes a way a responsibility may be fulfilled

# methods aren't 1st class in ruby
# defining a method doesn't immediately give you an object you can pass around


class Greeter
	def hello
		puts "hello, world!"
	end
end

# how to get a method you can pass around:
greeter = Greeter.new
m = greeter.method(:hello)
m.call # => hello, world

# note the verbosity. Really not idiomatic.

class TeaClock
	attr_accessor :timer # actual counting down. Waits until tea is ready, triggers an alert
	                    # doesn't need to know, or care how the alert is conveyed to the user.
	                    # e.g. maybe it's done via command line, maybe via growl-esque notifier
	attr_accessor :ui   # notify user of NB events, interact with user in general
	def initialize(minutes)
		self.ui = StdioUi.new
		self.timer = SleepTimer.new(minutes, ui)
		init_plugins
	end

	def init_plugins
		@plugins = []
		::Plugins.constants.each do |name|
			@plugins << ::Plugins.const_get(name).new(self)
		end
	end

	def start
		timer.start
	end
end

#Timer role
SleepTimer = Struct.new(:minutes, :notifier) do
	def start
		sleep minutes * 60
		notifier.notify("Tea is ready!") #send notify MESSAGE to the notifier. It does not CALL notify.
		                                 #It is a message being sent 
	end
end

#ui role
class StdioUi
	def notify(text)
		puts text
	end
end

module Plugins
	class Beep
		def initialize(tea_clock)
			tea_clock.ui.extend(UiWithBeep)
		end

		module UiWithBeep
			def notify(*)
				puts "BEEP!"
				super
			end
		end
	end
end

t = TeaClock.new(0.01).start
# => BEEP!
# => Tea is ready!


def umok(more_text)
	puts more_text
end