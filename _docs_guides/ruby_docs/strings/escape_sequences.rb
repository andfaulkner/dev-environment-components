# Never use single-quoted strings in Ruby. They limit escape sequences.
# Escape sequences ONLY work in double-quoted strings

puts "\nThis works to produce new lines...\nFor example this is on a new line."
puts '\nThis does not produce\nnew lines - the slash n remains in the output'
