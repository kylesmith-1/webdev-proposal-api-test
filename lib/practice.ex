defmodule Practice do
  @moduledoc """
  Practice keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def send() do
    Practice.Email.send("blazeneu@gmail.com", "kas.smith2000@gmail.com", "BlazeNEU Test", "this is a test")
  end


  def double() do
    2 * 2
  end

  def calc(expr) do
    # This is more complex, delegate to lib/practice/calc.ex
    Practice.Calc.calc(expr)
  end

  def factor(x) do
    # Maybe delegate this too.
    # [1,2,x]
    Practice.Factor.factor(2, x)
  end

  # TODO: Add a palindrome? function. DONE
  def palindrome?(word) do
    String.split(word, "", trim: true) == Enum.reverse(String.split(word, "", trim: true))
  end
end
