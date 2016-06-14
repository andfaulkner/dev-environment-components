# require 'pry'
require 'shoes'
# require 'shoes-backend'
require 'shoes/core'
require 'shoes/ui/cli'
require 'fileutils'

puts Shoes

def dir
  "./#{__FILE__.split("/")[0...-1].join "/"}"
end

files = []

[
  "./app/config/constants.rb",
  "./app/code_test_1.rb"
].each {
  |file|
  files << File.read(file)
}

# constants = File.read("./constants.rb")
# code_file = File.read("./code_test_1.rb")

# puts code_file

Shoes.app do

  puts self
  # app.each {}
  files.each { |content| self.instance_eval(content) }
  # self.instance_eval(constants)
  # self.instance_eval(code_file)
end
