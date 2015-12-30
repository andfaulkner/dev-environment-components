#!/usr/local/bin/ruby

require './utils/parse_cli_arguments.rb'

# get cli glags
flags = ParsedArguments.new(ARGV, {:item1=>"item11"})
puts flags.item1


# WIP, in a big way