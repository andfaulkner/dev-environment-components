require 'pry'

def dir
	"./#{__FILE__.split("/")[0...-1].join "/"}/"
end

puts " ----- Load the language definition / library-----"
require "#{dir}tDSL_01_project--dsl_definition.rb"


puts " ----- Load the code written in the DSL -----"
path = "#{dir}tDSL_01_project--executable_code.rb"
contents = File.read(path)

puts " ----- Instantiate the DSL library / definition -----"

project = Project.new

# puts " ----- Grab code -----"
project.instance_eval(contents, File.basename(path), 0)
puts project
