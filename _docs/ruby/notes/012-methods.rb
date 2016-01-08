<<<<<<< HEAD
#!/usr/bin/ruby

=======
#!/usr/local/bin/ruby

puts "\n------------------------------------------------------------------------------------------"
>>>>>>> 11577ce428cdac2cf57847116b2ee6b431bbd597
##################################################
#            				BASIC METHODS		             #
##################################################
# pretend asdf given as an argument

<<<<<<< HEAD

=======
puts "***************** BASIC METHODS *****************"

puts " ----- DEFINE A BASIC METHOD THAT TAKES 1 PARAMETER -----"
>>>>>>> 11577ce428cdac2cf57847116b2ee6b431bbd597
def output_text(text)
	puts text
end

<<<<<<< HEAD
output_text(ARGV[0]) # => asdf
output_text("something") # => something

=======
puts " ----- CALL BASIC METHOD THAT TAKES 1 PARAMETER -----"
output_text(ARGV[0]) # => asdf

puts " ----- CALL BASIC METHOD THAT TAKES 1 PARAMETER WITH A CLI ARGUMENT -----"
output_text("something") # => something


puts "------------------------------------------------------------------------------------------"
#############################
#          VARARGS          #
#############################
puts "***************** VARARGS *****************"

puts " ----- DEFINE METHOD THAT CAN TAKE 2 OR MORE PARAMS (VARIABLE NUMBER OF PARAMS) -----"
def sport_scores(sport, *more)
	puts "SPORT: #{sport}; SCORES: #{more}"
end

puts " ----- CALL FUNCTION THAT CAN TAKE 2 OR MORE PARAMS WITH 2 PARAMS -----"
sport_scores("snowboarding", "442s")

puts " ----- CALL FUNCTION THAT CAN TAKE 2 OR MORE PARAMS WITH 3 PARAMS -----"
sport_scores("soccer", 2, 1)

puts " ----- CALL FUNCTION THAT CAN TAKE 2 OR MORE PARAMS WITH 5 PARAMS -----"
sport_scores("tennis", 4, 2, 3, 4)

puts "------------------------------------------------------------------------------------------"
>>>>>>> 11577ce428cdac2cf57847116b2ee6b431bbd597
