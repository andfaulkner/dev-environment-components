######################################### List of hooks #########################################
# inherited
def inherited(child_class) #:nodoc:
  child_class.initialize_generated_modules
  super
end

# self.inherited
def self.inherited(child_class)
  puts "Hey I'm going to be called when I'm inherited"
  super
end

# self.included
def self.included(base)
  base.extend(ClassMethods)
end

#self.extended
def self.extended(base)
  puts "Howdy!"
end

# When you call Object#extend the extend_object callback is fired
module MyModule
  def self.extend_object(obj)
    puts "Hello from #{self}"
    super # important
  end
end
## Example: (myStr = "blah").extend(MyModule) # => Hello from MyModule
#actually extend the variable my_extended_string, which happens to be the string “blah”, with MyModule

# method_missing(method_name)
# self.const_missing(base)
# self.inherited(base)
