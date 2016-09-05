#!/usr/bin/env ruby

puts " ----- STRINGS -----"
my_str = "This is a string literal"
puts my_str

puts " ----- SYMBOLS -----"
my_symbol = :example_symbol
puts my_symbol

puts " ----- INTEGERS -----"
my_int = 4
puts my_int

puts " ----- FLOATS -----"
my_float = 4.2142
puts my_float

puts " ----- OCTALS -----"
my_octal = 0755
puts my_octal # Useful for Unix file permissions

puts " ----- HEXADECIMAL -----"
my_hexnum = 0x7FFF
puts my_hexnum

puts " ----- BINARY -----"
my_binary_num = 0b11111
puts my_binary_num 


# UNIX FILE PERMISSIONS MASK:
# U  G  O
# rwxrwxrwx
