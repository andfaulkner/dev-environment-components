defmodule Math do
  def one?(1) do
    true
  end
  def one?(x) when is_integer(x) do
    false
  end
end
