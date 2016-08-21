## -----------------------------------------------
## Comments
## -----------------------------------------------
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

## -----------------------------------------------
## File extensions
## -----------------------------------------------
#   .ex:  elixir file extension. Meant for compiling. Writes bytecode to disk in a .beam file
#         when compiled with elixirc nameoffile.ex
#   .exs: elixir scripting file extension. Meant to be interpreted rather than scripted. When
#         run using elixir name_of_file.exs, no bytocode file is created.
#
#   Elixir treats both the same way, but the intention is different: exs fiels are meant to
#   be compiled, while exs files are meant to be interpreted.
#   


## -----------------------------------------------------
## OR, AND, NOT
## -----------------------------------------------------
#------- and -------#
# ## and: keyword form
# *   examples:
        false and false #=> false
        false and true  #=> false 
        true and true  #=> true 
        # 1 and true   #=> [ERROR]
        false and raise("reached this error") #=> false
        true and raise("reached this error") #=> ** (RuntimeError) reached this error
# *   'and' in keyword form can only accept booleans

# ## and: operator form
# *   in sequence connected by &&, returns first item to return false, or final item
# *   examples:
        nil && 13  #=> nil
        true && 17 #=> 17
        false && 1 #=> false
        3 && 5     #=> 5
        3 && false #=> false
# *   'and' in operator form can accept any type: in this form it checks truthiness

#------- or -------#
# ## or: keyword form
# *   examples:
        true or true #=> true
        true or false #=> true
        false or false #=> false
        # 4 or false #=> [ERROR]
        true or raise("reached this error") #=> true
        false or raise("reached this error") #=> ** (RuntimeError) reached this error
# *   'or' in keyword form can only accept booleans

# ## or: operator form
# *   in sequence connected by ||, returns first item to return true, or final item
# *   examples:
        0 || 2  #=> 0
        false || 2  #=> 2
        "hello" || true  #=> "hello"
        "yo dogg" || false #=> "yo dogg"
        false || false #=> false
        false || nil #=> nil
        nil || false #=> false 
# *   'or' in operator form can accept any type: in this form it checks truthiness


#------- not -------#
# ## not: keyword form
# *   negates a boolean. Can only be run on a boolean.
# *   examples:
        not true #=> false
        not false #=> true
        not nil #=> [ERROR]
        not 5 #=> [ERROR]


# ## not: operator form
# *   converts value to boolean based on its falsiness, then negates the value (true
#     becomes false; and false becomes true)
# *   examples:
        !true #=> false
        !false #=> true
        !1 #=> false
        !nil #=> true
        !0 #=> false
        !"ok" #=> false

## -----------------------------------------------------
## Pattern matching
## -----------------------------------------------------
#------- Destructuring items out of sequences (tuples, arrays) -------#
# Example - destructuing out of tuple
    {a, b, c} = {:hello, "people", 42}
    a #=> :hello
    b #=> "people"
    c #=> 42

# Example - destructuring out of array
    [a, b, c] = [7, 22, "yep"]
    a #=> 7
    b #=> 22
    c #=> "yep"

# Number of args on left must match # of items in tuple
    {a, b, c} = {:hello, "people", 42, "wassup"} #=> [ERROR]

# Matching on some values, assigning those yet unassigned:
    {:ok, response_code} = {:ok, 200}
    response_code #=> 200

# Cannot compare different types
    # {a, b} = [3, 6] #=> [ERROR]

# Match head and tail of list
    [some_val | another_val] = [42, 321, 1493582, 293743, 99999]
    some_val #=> 0
    another_val #=> [321, 1493582, 293743, 99999]



## -----------------------------------------------------
## Lists
## -----------------------------------------------------
# Get first item from list
    hd([3241, 2, 3]) #=> 3241