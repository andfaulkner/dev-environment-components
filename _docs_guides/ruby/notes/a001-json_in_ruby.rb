#!/usr/bin/env ruby

# GET THE JSON MODULE
require 'json'

# PARSE A JSON OBJECT (IN STRING FORM)
my_hash = JSON.parse('{"hello": "goodbye"}')
puts my_hash # => {"hello"=>"goodbye"}

# RETRIEVE AN ELEMENT FROM THE HASH GENERATED BY PARSING A PARSED JSON OBJECT
puts my_hash["hello"] # => goodbye