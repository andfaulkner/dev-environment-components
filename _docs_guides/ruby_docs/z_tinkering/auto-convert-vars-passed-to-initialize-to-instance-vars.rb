### THIS REALLY ISN'T FUCKING WORKING ###

# module InitializeAll
#   def new(*var)
#     additional_initialize(*var)
#     super(*var)
#   end
#   def additional_intialize(*args)
#     args.each {}
#   end
  
# end

module InitializeAll
  # def self.method_added(method_name)
  #   puts "method added: #{method_name}"
  # end

  def self.extended(class_or_module)
    puts "InitializeAll:: self.extended entered! Mixed into: #{class_or_module}"

  end

  def self.included(class_or_module)
    puts "InitializeAll:: self.included entered! Mixed into: #{class_or_module}"
    puts class_or_module
    puts class_or_module.method :new

    # class_or_module.new.receiver
    # class_or_module.send :prepend, :initialize
    # orig_initialize = class_or_module.method :initialize
    # puts "original initializer: #{orig_initialize}"
    # puts class_or_module.methods.sort
    # # def class_or_module.poo
    # #   puts 'poo'
    # # end
    # puts class_or_module.class
    # class_or_module.hello
    original_method = Proc.new { puts 'bad!' }
    @@class_or_module = class_or_module

    @@class_or_module.class_eval do
      def orig_initialize(*args, &block)
        puts self
        initialize.dup(*args, &block)
      end
      puts 'exiting class eval'
    end

    puts @@class_or_module.method:initialize

    @@class_or_module.instance_eval do
      # original_initialize = method(:initialize).clone
      define_singleton_method(:orig_initialize, method(:initialize).clone)
      # {
      #   puts 'about to run original initializer'
      #     original_initialize.call
      # }
      puts "evalled into #{class_or_module} to remove initialize";
      puts method :initialize
      puts method('initialize').parameters

      original_method = method(:initialize).clone

      send(:define_method, :initialize_orig) {|*args, &block| method :initialize }
      send(:remove_method, :initialize)

      # define_method('initialize_original', )
      puts 'exiting instance_eval'
    end
    puts "original_method: #{original_method}"
    @original_method = original_method
    # puts 'exited class_eval'
    # puts orig_initialize
    puts "stored @@class_or_module: #{@@class_or_module}"
    puts "stored @@class_or_module methods: #{@@class_or_module.methods.sort}"
  end

  def initialize(*args, &block)
    puts 'InitializeAll:: overridden initialize entered!'
    puts "stored @@class_or_module in initialize: #{@@class_or_module}"
    puts args
    puts "@original_method: #{@original_method}"
    puts @@class_or_module.methods.sort.to_s
    orig_initialize
  end

  # def additional_initialize(*args, &block)
  #   puts 'InitializeAll:: overridden initialize entered!'
  # end
  # def new(*args, &block)

  #   puts 'overridden new entered!'
  #   obj = allocate
  #   obj.send :additional_initialize, *args, &block
  #   obj
  # end
end

class Testa
  def initialize(name, age, favourite_bear)
    puts "#{self.class}: regular initialize entered"
    puts args.each {|arg| puts arg}
  end

  def self.hello
    puts 'hello all!'
  end

  include InitializeAll

  # def values(*values)
  #   values
  # end

  # def initialize(*args)
  #   puts args.each {|arg| puts arg}
  # end
end

testa = Testa.new('meeka', 5, 'grizzly')
