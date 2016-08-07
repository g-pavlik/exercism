defmodule DNA do
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
    validate_nucleotide!(nucleotide)
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
    Enum.reduce(strand, base_histogram, &update_histogram/2)
  end

  @doc """
  Increments nucleotide count in histogram by 1
  """
  defp update_histogram(nucleotide, histogram) do
    validate_nucleotide!(nucleotide)
    Map.put(histogram, nucleotide, Map.get(histogram, nucleotide) + 1)
  end

  @doc """
  Checks if nucleotide is on the list of existing nucleotides
  """
  defp validate_nucleotide!(nucleotide) do
    if !Map.has_key?(base_histogram, nucleotide) do
      raise ArgumentError
    end
  end

  defp base_histogram do
    %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
  end
end
