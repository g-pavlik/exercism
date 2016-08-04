defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    if !Map.has_key?(%{?A => 0, ?T => 0, ?C => 0, ?G => 0}, nucleotide) do
      raise ArgumentError
    end
    Map.get(histogram(strand), nucleotide)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    histogram = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}

    Enum.reduce(strand, histogram, &update_histogram/2)
  end

  defp update_histogram(nucleotide, histogram) do
    if !Map.has_key?(histogram, nucleotide) do
      raise ArgumentError
    end
    Map.put(histogram, nucleotide, Map.get(histogram, nucleotide) + 1)
  end
end
