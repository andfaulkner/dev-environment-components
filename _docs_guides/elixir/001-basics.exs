# Single-line comments start with a #

# There are no multi-line comments. Good riddance.

## -----------------------------------------------
## Basic Types
## -----------------------------------------------
################## NUMBERS ##################

######### FLOATS #########
3.0
4.2

# Basic math
4.0 + 2.0 # => 6.0
4.0 + 2.3 # => 6.3 
6 - 2.0   # => 4.0
2 * 9.0   # => 18.0
10 / 5    # => 2
10 / 4    # => 2.5 
10 / 3    # => 3.3333333333333335

######### INTEGERS #########
# Integers
3
21

# Basic math
4 + 2        # => 6
6 - 2        # => 4
2 * 9        # => 18
div(10, 2)   # => 5
div(10, 3)   # => 3
rem(10, 3)   # => 1

################## TEXTUAL ##################

######### STRINGS #########
"hello!"
"rar rar gr I'm a bear"

######### ATOMS #########
# - basically symbols
# - always start with a :

IO.puts :im_an_atom
IO.puts :me_too

# determine if a var is an atom
IO.puts "** DETECT ATOMS **"
is_atom(:ok)            #=> true
is_atom Ok             #=> true
is_atom 1              #=> false
is_atom "ok"           #=> false
is_atom {:a, :b, :c}   #=> false

################## COLLECTIONS ##################

######### LISTS #########
[1, 2, 3, 4, 5]

# #get beginning and rest of list
[head | tail] = [1, 2, 3, 4, 5]
head #=> 1
tail #=> [2, 3, 4, 5]

#...can be any names
[jfjfjfjf | zzzzzzzzz] = [1, 2, 3, 4, 5]
jfjfjfjf #=> 1
zzzzzzzzz #=> [2, 3, 4, 5]

######### TUPLES #########
# - basically lists that provide benefits for immutability and punishments for mutation
# - unlike lists:
#   a) they are much faster for 'get info' type operations e.g. fetching element, getting length
#   b) it is very slow and expensive to mutate them compared to lists
# - use a tuple where you don't need or want to mutate a group of values
# - use an array where you need mutation

# define tuple
{:a, :b, :c} 

# fetch element from tuple
IO.puts elem({:a, :b, :c}, 0)         #=> :a 

# alter element in tuple
put_elem({:a, :b, :c}, 0, :d) #=> {:d, :b, :c}

asdf = :some_tuple

######### MAPS #########
map = %{:key => 0}

######### RANGES #########
1..20

# pattern match against a range
startastart..endoendo = 1..20
startastart #=> 1
endoendo #=> 1
