## -----------------------------------------------------
## Quote and unquote
## -----------------------------------------------------
# All Elixir expressions are internally represented as tuples with 3 elements: e.g.
# sum(1, 2, 3)   ..is represented internally as..   {:sum, [], [1, 2, 3]}
# 1 + 2          ..is represented internally as..   {:+, [context: Elixir, import: Kernel], [1, 2]}


#------- Get the internal representation of an elixir expression -------#
# e.g. to get the representation of --  omnomnom("yum", 42, "ok")  --  do this: 
quote do: omnomnom("yum", 42, "ok")
#=> {:omnomnom, [], ["yum", 42, "ok"]}

# get the representation of a call with an operator
quote do: 6 * 32
#=> {:*, [context: Elixir, import: Kernel], [6, 32]}

#------- Get original expression out of a quote -------#
Macro.to_string(quote do: 6 * 32)
#=> "6 * 32"

#------- Reference an outside value from within a quote (akin to interpolation) -------#
fn_name = :square
Macro.to_string(quote do: unquote(fn_name)(14))
#=> "square(14)"

#------- Reference outside array as individual items (a la 'apply') from within a quote -------#
my_array = [4, 5, 6]
Macro.to_string(quote do: [1, 2, 3, unquote_splicing(my_array), 7, 8, 9])
#=> "[1, 2, 3, 4, 5, 6, 7, 8, 9]"

## -----------------------------------------------------
## Example macro
## -----------------------------------------------------
defmodule Unless do
  def fun_unless(clause, expression) do
    if(!clause, do: expression)
  end

  defmacro macro_unless(clause, expression) do
    quote do
      if(!unquote(clause), do: unquote(expression))
    end
  end
end