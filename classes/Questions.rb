class Question

  attr_reader :answer

  def initialize(range)
    @num1 = rand(1..(range).to_i)
    @num2 = rand(1..(range).to_i)
    @answer = @num1 + @num2
  end

  def question
    puts "What is #{@num1} plus #{@num2}?"
  end

  def answer?(guess)
    guess == @answer
  end
end