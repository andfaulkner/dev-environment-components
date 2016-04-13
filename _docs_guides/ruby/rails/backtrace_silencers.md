##Silencing crap output
*   To hide crap in stacktrace in tests, add this to config/initializers/backtrace_silencer.rb:

		Rails.backtrace_cleaner.add_silencer { |line| line =~ /(rvm|rbenv)/ }

*   again, minitest is assumed here
