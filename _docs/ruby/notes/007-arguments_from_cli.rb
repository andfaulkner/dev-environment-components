<<<<<<< HEAD
#!/usr/bin/ruby
=======
#!/usr/local/bin/ruby
>>>>>>> 11577ce428cdac2cf57847116b2ee6b431bbd597
#################################################
#            HANDLING ARGS FROM CLI             #
#################################################
#
# Assume this was run by:
# 	007-arguments_from_cli.rb asdf qwerty 

puts "\n----- OUTPUT ARRAY CONTAINING ALL ARGUMENTS GIVEN -----"
puts ARGV.to_s # => ["asdf", "qwerty"]

puts "\n----- GET FIRST ARGUMENT -----"
puts ARGV[0] # => "asdf"

# ARGV is a regular array
