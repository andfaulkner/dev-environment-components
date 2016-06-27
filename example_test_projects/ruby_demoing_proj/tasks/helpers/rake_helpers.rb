# encoding: utf-8

puts 'rake helpers loaded'

# Helpers
class DirStack
  include Singleton

  attr_reader :dir_stack # accessors
  attr_reader :root_dir # accessors

  def initialize
    @root_dir = Dir.pwd
    @dir_stack = [Dir.pwd]
  end

  def <<(pushed)
    @dir_stack << pushed
  end

  def pop
    @dir_stack.pop
  end

  def empty?
    @dir_stack.empty?
  end
end

# ensure launch directory gets saved as root
DirStack.instance

def pushd(new_dir, verbose = false)
  dir_stack = DirStack.instance
  dir_stack << Dir.pwd
  Dir.chdir(new_dir)
  p "push succeeded! Stack: #{dir_stack.dir_stack.join(', ')}" if verbose
end

def popd(verbose = false)
  dir_stack = DirStack.instance
  if dir_stack.empty?
    puts 'no dir stack exists, cannot change dir' if verbose
  else
    puts "previous directory: #{Dir.pwd}" if verbose
    new_dir = dir_stack.pop
    Dir.chdir new_dir
    puts "new directory: #{new_dir}" if verbose
  end
end

def root_dir
  dir_stack = DirStack.instance
  puts dir_stack.root_dir
end
