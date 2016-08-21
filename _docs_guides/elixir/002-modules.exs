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

#------- Grab a function, store in another variable -------#
# Example:
fun = &Math.one?/1 # fun now contains the Math.one? function defined above

# To run a function stored in a variable:
fun.(1) #=> true
fun.(0) #=> false

#------- Determine whether or not a variable is a function -------#
# Example:
is_function(fun)

