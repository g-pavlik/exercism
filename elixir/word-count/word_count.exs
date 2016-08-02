defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    String.replace(sentence, "_", " ") |>
      String.replace(~r/[^\p{L} \d-]/u, "") |>
      String.downcase |>
      String.split |>
      Enum.reduce(%{}, &update_word_count/2)
  end

  @doc """
  Finds word key in map and increments it's value by 1
  If not found - inserts new item in map with value 1
  """
  defp update_word_count(word, map) do
    Map.put(map, word, Map.get(map, word, 0) + 1)
  end
end
