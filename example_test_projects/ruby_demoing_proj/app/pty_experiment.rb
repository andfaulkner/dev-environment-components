require 'rbconfig'
require 'pty'
require 'pry'

puts "\n----------- Running pty_experiment -----------"

# Helper method - test for trying the pty stream out
def hello(source, expect_input)
  puts "[child] Hello from #{source}"
  if expect_input
    puts "[child] Standard input contains: \"#{$stdin.readline.chomp}\""
  else
    puts "[child] No stdin, or stdin is same as parent's"
  end
  $stderr.puts "[child] Hello, standard error"
  puts "[child] DONE"
end

# if $PROGRAM_NAME == __FILE__

##### Constants & Settings #####
THIS_FILE = File.expand_path(__FILE__)
puts THIS_FILE

RUBY = File.join(RbConfig::CONFIG['bindir'], RbConfig::CONFIG['ruby_install_name'])
puts RUBY

$stdout.sync = true
################################


PTY.spawn(RUBY, '-r', THIS_FILE, '-e', 'hello("PTY", true)') do |output, input, pid|
  puts("\n ********** Executing code in spawned process **********")
  input.write("Current pid: #{pid}\n")
  input.write("hello from parent\n")
  puts input
  buffer = ''
  until buffer =~ /DONE/ do
    puts 'looped!'
    output.readpartial(1024, buffer)
    puts output.to_s
    puts output.methods.sort
    binding.pry
  end
  puts 'loop ended'
  buffer.split("\n").each do |line|
    puts "[parent] output: #{line}"
  end
end

puts '---'

# end
