require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"
  opts.on("-d", "--[no-]define_singleton_methods", "Run experiment showing singleton methods") do |v|
    options[:singleton_experiment] = v
  end
  opts.on("-s", "--[no-]server", "launch the rack server") do |v|
    options[:run_server] = v
  end
end.parse!

puts "launch server!" if options[:run_server] 

require './experiments/define_singleton_methods' if options[:singleton_experiment] 
require './experiments/access_private_methods'
require './experiments/overriding_brackets'
