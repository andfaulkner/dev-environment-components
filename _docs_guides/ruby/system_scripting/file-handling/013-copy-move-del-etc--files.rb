#!/usr/bin/ruby
puts "------------------------------------------------------------------------------------------"
###################################
#          FS OPERATIONS          #
###################################
puts "***************** FS OPERATIONS *****************"
# to prep for it
require('fileutils.rb')

puts " ----- DELETE A FILE -----"
FileUtils.delete("file_name")

puts " ----- COPY A FILE -----"
FileUtils.copy("file_name", "new_file_name")