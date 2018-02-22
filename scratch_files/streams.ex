defmodule Streams do
  def large_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.filter(&(String.length(&1) > 80))
  end

@doc """
  Returns a list of integers. Each index is the corresponding line's length
"""
  def lines_lengths!(path) do
    File.stream!(path)
    |> Stream.map(&String.length/1)
    |> Enum.to_list
  end

@doc """
  Returns the length of the longest line of the file
"""
  def longest_line_length!(path) do
    File.stream!(path)
    |> Stream.map(&String.length/1)
    |> Enum.max
  end

@doc """
  Returns the contents of the longest line of the file
"""
# Read file
# Find longest line
# Return that line via 
  def print_file(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.with_index(1)
    |> flip_tuple_list()
    |> Enum.to_list()
    |> print_as_doc()
  end
  
  defp flip_tuple_list(tuple_list), do: 
    for {a, b} <- tuple_list, do: {b, a}
  
  defp print_as_doc(tuple_list), do:
    for {index, line} <- tuple_list, do:
      IO.puts("#{index}| #{line}\n")

end