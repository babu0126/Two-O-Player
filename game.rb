class Game
  attr_accessor :turn
  def initialize
    @turn = 1
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
  end
  
  def start
    puts "Starting ..."
    puts "#{turn}"
    question = Question.new(turn)
    question.generate_question ? update_turn(turn) : update_lives(turn)
    show_stats
    start
  end

  def update_turn(turn)
    turn == 1 ? @turn = 2 : @turn = 1
  end
  
  def update_lives(turn)
    turn == 1 ? @player1.lives -= 1 : @player2.lives -= 1
    check_lives(turn)
  end
  
  def check_lives(turn)
    if @player1.lives == 0
      game_over(@player2.name, @player2.lives)
    elsif @player2.lives == 0
      game_over(@player1.name, @player1.lives)
    else
      update_turn(turn)
    end
  end

  def show_stats
    puts "P1: #{@player1.lives}/3 VS P2: #{@player2.lives}/3"
  end

  def game_over(player, lives)
    puts "#{player} wins with the score of #{lives}/3"
    puts "------ GAME OVER ------"
    puts "Goodbye!"
    exit(0)
  end
end
