# encoding: utf-8
# frozen_string_literal: true

Hash_orig = Hash.dup

$HASH_VERBOSE = true

# monkey-patch hash to log events
class Hash
  alias_method :orig_method_missing, :method_missing
  alias_method :orig_squarebrackets_equals, :[]=
  alias_method :orig_squarebrackets, :[]

  class << self
    alias_method :orig_method_missing, :method_missing
    def method_missing(sym, *args, &block)
      puts 'method missing!' if $HASH_VERBOSE
      orig_method_missing.call(sym, *args, block)
    end
  end

  def method_missing(sym, *args, &block)
    puts 'method missing!' if $HASH_VERBOSE
    orig_method_missing(sym, *args, block)
  end

  def initialize(*args)
    @added_methods ||= []
    puts "making new hash: #{args}" if $HASH_VERBOSE
    puts "About to call super"
    super(*args)
  end

  def self.aliased_methods
    instance_methods.group_by {|m| instance_method(m) }
    
                    .map(&:last)
                    .keep_if {|symbols| symbols.length > 1 }
  end

  def self.verbose_global!(is_verbose)
    $HASH_VERBOSE = is_verbose
  end

  def self.method_added(name)
    @added_methods ||= []
    @added_methods.find_index(name.to_sym)

    if @added_methods.include?(name.to_sym)
      puts "#{name} removed!" if $HASH_VERBOSE
      @added_methods.delete_if {|i| i == name.to_sym }
    else
      puts "#{name} added!" if $HASH_VERBOSE
      (@added_methods ||= []) << name.to_sym
    end
    puts @added_methods if $HASH_VERBOSE
  end

  def []=(key, val)
    puts "#{val} --assigned to--> #{key}}" if $HASH_VERBOSE
    orig_squarebrackets_equals(key, val)
  end

  def [](sym)
    puts "Hash:: getting value:: #{sym}" if $HASH_VERBOSE
    orig_squarebrackets(sym)
  end
end

puts "aliased Hash methods: #{Hash.aliased_methods}" if $HASH_VERBOSE

# reverse the monkey patches here
def depatch_hash
  Hash.class_eval do
    puts "added methods: #{@added_methods ? @added_methods : 'none' }" if $HASH_VERBOSE
    (@added_methods ||= []).each {|method|
      orig_method = "orig_#{method.to_s.gsub('[]', 'squarebrackets').gsub('=', '_equals')}"
      alias_method method.to_sym, orig_method.to_sym
    }
    alias_method :[]=, "orig_squarebrackets_equals"
    alias_method :[], "orig_squarebrackets"
  end
end

# depatch_hash
