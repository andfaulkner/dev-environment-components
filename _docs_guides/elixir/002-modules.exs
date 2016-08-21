## -----------------------------------------------------
## Basic module syntax
## -----------------------------------------------------
defmodule SomeModule do
  def some_function(arg, another_arg) do
    # code the function runs
  end
end

# Example:
defmodule Math do
  def add(num1, num2) do
    num1 + num2
  end
end

# Calling a funciton in a module
IO.puts "OUTPUT:"
IO.puts Math.add(2, 3)

# Functions can only be defined inside a module

#------- Define a constant in a module -------#
defmodule TestModule do
  
  # constant gets defined here
  @some_constant_here 2

  IO.inspect @some_constant_here #=> 2

#------- Reference a module constant from a function in the same module -------#
  def first_constant, do: @some_constant_here

end

TestModule.first_constant #=> 2

## -----------------------------------------------------
## Compiling modules
## -----------------------------------------------------

# *   Create a file containing the module, with .ex extension
# *   run this in the cli:
#         elixirc nameoffile.ex
# *   open iex in the same directory - the module should now be available for use within iex
#     as long as you loaded iex in the same directory the module is in
#     
# *   to run a module, and have access to the contents in a repl: iex name_of_file.exs

## -----------------------------------------------------
## Named functions
## -----------------------------------------------------
#------- Private functions -------#
# EXAMPLE:
defmodule Math2 do
  defp do_sum(a, b) do # cannot be called from outside, because it's defined with defp
    a + b
  end

#------- Public function -------#
  def do_multiply(a, b) do # can be called from outside, because it's defined with def
    a * b
  end

#------- Functions w/ guard clauses -------#
# guard clause with a matching value guard (i.e. only run if arg passed matches exact value)
  def one?(1) do
    true
  end

# guard clause with a condition guard (i.e. only run if arg passed meets given condition)
  def one?(x) when is_integer(x) do
    false
  end

end

IO.puts Math2.one?(1) #=> true
IO.puts Math2.one?(5) #=> true

## -----------------------------------------------------
## Function capturing
## -----------------------------------------------------

#------- Grab a function, store in another variable -------#
# Example:
fun1 = &Math.one?/1 # fun now contains the Math.one? function defined above

# To run a function stored in a variable:
fun1.(1) #=> true
fun1.(0) #=> false

#------- Determine whether or not a variable is a function -------#
# Example:
is_function(fun1)

#------- Define and immediately capture new function -------#
# Examples:

# define a new function on the fly
fun2 = &(&1 + 1) # &1 defines where the 1st arg given to the fn goes. &2 defines 2nd slot, & so on
#run the captured fn
fun2.(3) #=> 4

func = &(&1 + &2 + 6)
func.(5, 2) #=> 13

#------- Capture function from module -------#
func2 = &List.flatten/1
func2.([1, 82, 23, [41, 32]]) #=> [1, 82, 23, 41, 32]


## -----------------------------------------------------
## Default arguments
## -----------------------------------------------------


## -----------------------------------------------------
## Module documentation
## -----------------------------------------------------
#------- Document a module -------#
defmodule MoreMath do
  @moduledoc """
  Does math type things.

  ## Examples:

      iex> Math.subtract(8, 2)
      6
  """

#------- Document a function in a module -------#

  @doc """
    Subtracts the 2nd number from the 1st number
  """
  def subtract(a, b), do: a - b
end

#------- View help for a module or function from the repl -------#
### Example: module ###
# iex>      h MoreMath
# =>                                       Math
# => 
# => Does math type things.
# =>
# => Examples:
# =>
# => ┃ iex> Math.subtract(8, 2)
# => ┃ 6

### Example: function ###
# iex>      h Math.subtract
# =>                                def subtract(a, b)
# =>
# => Subtracts the 2nd number from the 1st number

