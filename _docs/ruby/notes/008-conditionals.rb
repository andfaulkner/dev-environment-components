#!/usr/local/bin/ruby
################################
############ UNLESS ############
################################
def show_usage_info_quit
	puts "\nUSAGE: differences.rb some_name ?is_it_raining\n\n"
	exit
end

def correct_num_args?
	ARGV.length >= 2
end

puts "\n------ REVERSE CONDITIONAL: runs unless a certain condition is met ------"
unless correct_num_args?
	show_usage_info_quit
end

# equivalent to if not
if not correct_num_args?
	show_usage_info_quit
end

##################################
############ IF-ELSE #############
##################################
name = ARGV[0]

puts "\n------ REGULAR IF-ELSIF-ELSE CONDITIONAL ------"
if ARGV[0].downcase == "meeka"
	puts "it's a puppy!"
elsif ARGV[0].downcase == "lisa"
	puts "it's a butthead!"
else
	puts "it's neither a puppy or a butthead!"
end

##################################
############ TERNARY #############
##################################

puts "\n------ EXACTLY LIKE ANY OTHER LANGUAGE'S TERNARY OPERATOR ------"
puts ARGV[0][0].upcase! ? "name is capitalized" : "name isn't capitalized"

#######################################
############ SHORTHAND IF #############
#######################################

puts "\n------ ONE LINE IF STATEMENT ------"
puts "it's raining" if ARGV[1] == 'raining' or ARGV[1] == "true"

###########################################
############ SHORTHAND UNLESS #############
###########################################
weather = ["cold", "raining"]

weather.pop unless ARGV[1] == "raining" or ARGV[1] == "true"

puts "weather is: #{weather.join(", ")}"
