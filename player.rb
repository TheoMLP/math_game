class Player 
  attr_accessor :lives, :name

  def initialize(n)
    self.lives = 3
    self.name = n
  end

  def dead?
    self.lives <= 0
  end

  def lose_one_life
    self.lives -= 1
  end
end