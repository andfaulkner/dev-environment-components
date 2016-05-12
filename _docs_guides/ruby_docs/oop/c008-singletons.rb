# TODO


puts "------------------------------------------------------------------------------------------"
#####################################
#          SINGLETON CLASS          #
#####################################
puts "***************** SINGLETON CLASS *****************"

puts " ----- DEFINE A SINGLETON CLASS. SET UP SO REGULAR ClassName.new CAN'T BE CALLED -----"
puts " ----- CLASS IS BUILT USING 'create' CLASS METHOD INSTEAD -----"
class Logger
  private_class_method :new 			 # <<< prevents Logger.new from being called
  @@logger = nil 									 # <<< keeps an instance of a created logger
  def Logger.create 							 # <<< new constructor function 
    @@logger = new unless @@logger # <<< prevents creation of a new logger if one already exists
    @@logger
  end
end
