puts "------------------------------------------------------------------------------------------"
####################################
#          METHOD_MISSING          #
####################################
puts "***************** DEFINE A NEW VALUE FOR METHOD_MISSING IN A CORE CLASS *****************"
class Array
	def method_missing(method_name)
		puts "Method #{method_name} doesn't exist in class #{self.class}"
		puts "Contents of class: #{self.inspect}"
	end
end

puts " ----- CALL A METHOD THAT DOESN'T EXIST - IT WILL RUN YOUR NEW FUNCTION -----"
[1, 2, 3, 4].awfwfewf

puts " ----- REDEFINE method_missing FOR CLASSES THAT DON'T DEFINE IT THEMSELVES, & CALL ORIG-----"
class BasicObject
	original_method_missing = instance_method(:method_missing)	

  define_method(:method_missing) do |sym, *args, &block|
  	puts 'in!'
    original_method_missing.bind(self).call(sym, *args, &block)
  end
end

puts " ----- REDEFINE method_missing - USING alias_method (cleaner) -----"
class BasicObject
	alias_method :orig_method_missing, :method_missing

	def method_missing(sym, *args, &block)
		puts "hello override!"
		orig_method_missing(sym, *args, block)
	end

end

# p "asdf".oooooooooooooooergaegauhg
# => hello override!
#    in!
#    012-methods.rb:79:in `call': undefined method `oooooooooooooooergaegauhg' for "asdf":String (NoMethodError)
#    ...


puts "------------------------------------------------------------------------------------------"
################################
#          respond_to          #
################################
puts "***************** respond_to *****************"

class ShellApprox
  def self.pwd
    Dir.pwd
  end

  def self.ls
    Dir.new(pwd)
  end

  alias_method :orig_method_missing, :method_missing
  def method_missing(method_name, *args, &block)
    puts "method name: #{method}"
    if method_name.to_s =~ /^ls_/
      puts "ls params unknown"
      self.ls
    else
      orig_method_missing(sym, *args, block) # acts as call to "super"
    end
  end

  def respond_to_missing? *args
    # TODO understand this
  end
end

