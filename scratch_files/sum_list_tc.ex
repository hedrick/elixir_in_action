defmodule ListHelper do
  
  def sum(list) do
    do_sum(0, list)
  end

# Matches on empty list, stopping recursion
  defp do_sum(current_sum, []) do
    current_sum
  end

# Sums head and current sum, then recursively calls itself
  defp do_sum(current_sum, [head | tail]) do
    new_sum = head + current_sum
    do_sum(new_sum, tail)
  end

  def length(list) do
    length_do(0, list)
  end

  defp length_do(current_len, []) do
    current_len
  end

  defp length_do(current_len, [ _ | tail ]) do
    current_len = current_len + 1
    length_do(current_len, tail)
  end

  def range(from, to) when from == to do
    [from]
  end

  def range(from, to) when from < to and to > from do
    range_do(from, to, [])
  end

  defp range_do(from, to, _list) when from == to do
    IO.puts("from == to")
    [from]
  end
  defp range_do(from, to, _list) when from + 1 == to do
    IO.puts("from + 1 == to")
    [from, to]
  end
  defp range_do(from, to, list) do
    IO.puts("from + 1 != to")
    [_head | tail] = list
  end

end