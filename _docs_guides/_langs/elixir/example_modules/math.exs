defmodule Math do
  @moduledoc """
  Does math type things.

  ## Examples:

      iex> Math.subtract(8, 2)
      6
  """
    def one?(1) do
        true
    end
    def one?(x) when is_integer(x) do
      false
    end

    @doc """
      Subtracts the 2nd number from the 1st number
    """
    def subtract(a, b), do: a - b
end


