#!/usr/bin/ruby


puts "------------------------------------------------------------------------------------------"
###################################
#          CREATE A FILE          #
# ###################################
# puts "***************** CREATE A FILE *****************"

# puts " ----- CONSTRUCT A TEXT FILE WITH A TEST STRING IN IT, IN THE SAME DIR. METHOD 1 -----"
# output_file = File.new("test_file.txt", "w+")
# output_file.write("test file content here") 
# output_file.close
# # => outputs a new file named test_file.txt, containing the string "test file content here"

# puts " ----- CONSTRUCT A TEXT FILE WITH A TEST STRING IN IT, IN THE SAME DIR. METHOD 2 -----"
# File.open("test_file_2.txt", "w+") do |file|
# 	file.write("Another file's content!")
# end
# # => outputs a new file named test_file_2.txt, containing the string "Another file's content!"


puts "------------------------------------------------------------------------------------------"
#######################################################
#          READ CONTENTS OF AN EXISTING FILE          #
#######################################################
puts "***************** READ CONTENTS OF AN EXISTING FILE *****************"
puts " ----- READ IN A MARKDOWN SCRIPT / FILE IN THE SAME DIRECTORY -----"
file_2 = File.new("test_file.txt", "r+")
p file_2.read # => "test file content here"
	
file_2.close