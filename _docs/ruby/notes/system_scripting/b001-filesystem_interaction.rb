#!/usr/bin/ruby

require 'etc'

puts "------------------------------------------------------------------------------------------"
############################################
#           GET FILESYSTEM INFO            #
############################################
puts "***************** GET FILESYSTEM INFO *****************"

puts " ----- GET FILE EXTENSION -----"
puts File.extname("./test_file.txt") 			# => .txt

puts " ----- DETERMINE IF SOMETHING IS A FILE -----"
puts File.file?("./test_file.txt") 				# => true

puts " ----- DETERMINE IF SOMETHING IS A DIRECTORY -----"
puts File.directory?("./test_file.txt") 	# => false
puts File.directory?("./") 								# => true

puts " ----- DETERMINE IF SOMETHING EXISTS -----"
puts File.exists?("./test_file.txt") 			# => true
puts File.exists?("./i_dont_exist.txt") 	# => false

puts " ----- DETERMINE IF SOMETHING IS EXECUTABLE -----"
puts File.executable?("./test_file.txt")	# => false
puts File.executable?("./b001-filesystem_interaction.rb") # => true  {{self-referential :D}}

puts " ----- DETERMINE IF SOMETHING IS WRITABLE -----"
puts File.writable?("./test_file.txt") 		# => true

puts " ----- DETERMINE IF SOMETHING IS READABLE -----"
puts File.readable?("./b001-filesystem_interaction.rb") # => true  {{self-referential :D}}


puts "------------------------------------------------------------------------------------------"
#######################################
#          GET FILE METADATA          #
#######################################
puts "***************** GET FILE METADATA *****************"

puts " ----- GET FILE SIZE IN BYTES -----"
puts File.size("./test_file.txt")	 # => 307

puts " ----- GET FILE TYPE -----"
puts File.ftype("./test_file.txt") # => file
# other possible outputs: directory, socket, link, unknown, characterSpecial, blockSpecial, fifo


puts "------------------------------------------------------------------------------------------"
############################################
#          FILE STATISTICS OBJECT          #
############################################
puts "***************** FILE STATISTICS OBJECT *****************"

puts " ----- GET FILE STAT OBJECT -----"
test_file_stat_obj = File.stat("./test_file.txt")
puts test_file_stat_obj

puts " ----- VIEW PRETTY FORM OF STAT OBJECT - OUTPUTS ALL FILE DETAILS -----"
puts test_file_stat_obj.inspect 

puts " ----- GET LAST ACCESS TIME FOR A FILE -----"
puts test_file_stat_obj.atime			# => 2016-01-02 01:24:42 -0500

puts " ----- GET LAST MODIFICATION TIME FOR A FILE -----"
puts test_file_stat_obj.mtime			# => 2015-12-31 03:15:41 -0500

puts " ----- GET NUMBER OF HARD LINKS TO A FILE -----"
puts test_file_stat_obj.nlink			# => 1

puts " ----- GET GID (NUMERIC GROUP ID) OF OWNER OF FILE -----"
puts test_file_stat_obj.gid

puts " ----- GET UID (USER ID) OF OWNER OF FILE -----"
puts test_file_stat_obj.uid

puts " ----- DETERMINE IF SCRIPT PROCESS RUNNER OWNS THE FILE -----"
puts test_file_stat_obj.owned?		# => true

puts " ----- DETERMINE IF FILE IS A SOCKET -----"
puts test_file_stat_obj.socket?		# => false

puts " ----- DETERMINE IF FILE IS A SYMLINK -----"
puts test_file_stat_obj.symlink? 	# => false


puts "------------------------------------------------------------------------------------------"
#####################################
#          COMPARING FILES          #
#####################################
puts "***************** COMPARING FILES *****************"

puts " ----- DETERMINE IF 2 FILES ARE IDENTICAL -----"
# note that even copies of files don't meet this criterion: it must actually point to the same file
puts File.identical?("./test_file.txt", "./test_file_dupe.txt") # => false
puts File.identical?("./test_file.txt", "./test_file.txt")			# => true


puts "------------------------------------------------------------------------------------------"
#####################################################
#          FILE PATH CREATION AND HANDLING          #
#####################################################
puts "***************** FILE PATH CREATION AND HANDLING *****************"

puts " ----- JOIN STRINGS INTO A FILE PATH -----"
puts File.join(ENV["HOME"], "projects") # => /home/andrew/projects



puts "------------------------------------------------------------------------------------------"
######################################
#          READ FROM A FILE          #
######################################
puts "***************** READ FROM A FILE *****************"

puts " ----- READ A FILE -----"
test_file = File.open("test_file.txt")
puts test_file

puts " ----- GET NAME OF A STORED FILE -----"
puts test_file.to_path

puts " ----- DISPLAY A FILE'S CONTENTS' -----"
test_file.each {|line| puts line}
puts " --------------------------------------"

puts " ----- CLOSE A STORED FILE -----"
test_file.close

puts " ----- DISPLAY A FILE'S CONTENTS WITHOUT STORING FILE IN A VARIABLE -----"
File.open("test_file.txt") do |myfile|
	myfile.each {|line| puts line}
end
puts " --------------------------------------"

puts " ----- DISPLAY FILE CONTENT W/OUT STORING IN VAR, W/ AN I/O STREAM (EVEN MORE COMPACT) -----"
# opens the file specified, feeds it line by line into a block, then closes it.
IO.foreach("test_file.txt") {|line| puts line}
puts " --------------------------------------"


# METHOD THAT READS AND OUTPUTS A FILE
def display_file(filepath)
	IO.foreach(filepath) {|line| puts line}
end

puts "------------------------------------------------------------------------------------------"
#####################################
#          WRITE TO A FILE          #
#####################################
puts "***************** WRITE TO A FILE *****************"

puts " ----- CREATE A NEW EMPTY FILE -----"
File.open("test_file_2.txt", "w").close

puts " ----- CREATE A NEW FILE AND WRITE TO IT -----"
##########
File.open("test_file_3.txt", "w") do |myfile|
	myfile.write("This is the content of the new file - test_file_3.txt")
end
##########
display_file("test_file_3.txt") # output the content of the file
puts " --------------------------------------"

puts " ----- WRITE TO AN EXISTING FILE, REPLACING CONTENTS -----"
##########
File.open("test_file_3.txt", "w") do |myfile|
	myfile.write("This is the new content of test_file_3.txt, which overwrote what was there before")
end
##########
display_file("test_file_3.txt") # output the content of the file
puts " --------------------------------------"

File.open("test_file_3.txt", "w") do |myfile|
	myfile.write("This is the new content of test_file_3.txt, which overwrote what was there before")
end



puts "------------------------------------------------------------------------------------------"
###################################
#          RENAME A FILE          #
###################################
puts "***************** RENAME A FILE *****************"
File.rename("test_file_2.txt", "test_file_2_renamed.txt") # <-- file is now test_file_2_renamed.txt

###################################
#          DELETE A FILE          #
###################################
puts "***************** DELETE A FILE *****************"
File.delete("test_file_2_renamed.txt") # <-- file no longer exists
# readfile("test_file_2_renamed.txt") 
				# => undefined method `readfile' for main:Object (NoMethodError)



puts "------------------------------------------------------------------------------------------"
#############################################
#          CHANGE FILE PERMISSIONS          #
#############################################
puts "***************** CHANGE FILE PERMISSIONS *****************"

# create a test file
File.open("./test_file_4.txt", "w").close

puts " ----- CHANGE FILE OWNERSHIP -----"
File.chown(nil, 1000, "./test_file_4.txt")