class Question
  attr_accessor :number1, :number2

  def initialize
    self.number1 = rand(1..20)
    self.number2 = rand(1..20)
  end

  def content
    "What does #{self.number1} plus #{self.number2} equal?"
  end

  def correct?(answer)
    solution = self.number1 + self.number2
    answer == solution ? true : false
  end
end