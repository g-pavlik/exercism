defmodule Bob do
  def hey(input) do
    cond do
      ends_with_question_mark?(input) -> "Sure."
      has_two_uppercase_letters?(input) -> "Whoa, chill out!"
      is_empty?(input) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  defp ends_with_question_mark?(input) do
    String.last(input) == "?"
  end

  defp has_two_uppercase_letters?(input) do
    String.match?(input, ~r/\p{Lu}{2,}/u)
  end

  defp is_empty?(input) do
    String.length(String.trim(input)) == 0
  end
end
