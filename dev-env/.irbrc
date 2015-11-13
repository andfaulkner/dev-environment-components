# pp = prints nested hashes & arrays in a readable, indented format
require 'pp'

require 'rubygems'

# wirble = cross-session history, colored output, auto-completion
require 'wirble'

# when you write a line that should have an indent in the next line - such
# as "class Object" - it actually indents the next line
IRB.conf[:AUTO_INDEX] = true

########## MAKE A VARIETY OF COMMON UNIX COMMANDS WORK IN irb ##########
def ls
  %x{ls}.split("\n")
end

def cd(dir)
    Dir.chdir(dir)
    Dir.pwd
end

def pwd
    Dir.pwd
end
########################################################################

