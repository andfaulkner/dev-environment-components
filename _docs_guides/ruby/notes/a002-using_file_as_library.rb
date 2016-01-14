<<<<<<< HEAD
#!/usr/bin/ruby
=======
#!/usr/local/bin/ruby
>>>>>>> 11577ce428cdac2cf57847116b2ee6b431bbd597


puts "------------------------------------------------------------------------------------------"
##########################################################################
#          SET UP FILE TO BE BOTH RUNNABLE AND LIBRARY FRIENDLY          #
##########################################################################
if __FILE__ == $0
	puts "run this code here if this is the main file being run"
	puts "why? because you can use this as a library otherwise"
	puts "...which is where classes actually start to matter"
end

puts " ----- NAME OF CURRENT FILE BEING RUN -----"
puts __FILE__

puts " ----- FIRST ITEM INPUTTED INTO TERMINAL (command that ran script, sans 'ruby') -----"
puts $0