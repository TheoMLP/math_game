class Game
  attr_accessor :player1, :player2, :turn, :active_player
  
  def initialize
    self.player1 = Player.new('Player 1')
    self.player2 = Player.new('Player 2')
    self.turn = 0
    self.active_player = self.player1
  end

  def round
    round_question = Question.new
    if self.turn != 1
      puts "----- NEW TURN -----"
    end
    puts "#{self.active_player.name}: #{round_question.content}"
    answer = gets.chomp.to_i
    correct = round_question.correct?(answer)
    puts self.verificationMessage(correct)
    puts "P1: #{self.player1.lives}/3 vs P2: #{self.player2.lives}/3"
  end

  def run_game
    while (!self.player1.dead? && !self.player2.dead?)
      self.active_player == player1 ? self.active_player = self.player2 : self.active_player = self.player1
      self.turn += 1
      round
    end
    self.gameOver
  end

  def verificationMessage(correct)
    if correct
      "#{self.active_player.name}: YES! You are correct."
    else
      self.active_player.lose_one_life
      "#{self.active_player.name}: Seriously? No!"
    end
  end

  def gameOver
    if self.player1.dead?
      puts "Player 2 wins with a score of #{self.player2.lives}/3"
    else 
      puts "Player 1 wins with a score of #{self.player1.lives}/3"
    end
    puts "----- GAME OVER -----"
    puts "Good Bye!"
  end
end