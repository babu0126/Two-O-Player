class Question
  attr_accessor :turn
  def initialize(turn)
    @turn = turn
  end
  
  def generate_question
    num1 = rand(1..50)
    num2 = rand(1..50)
    puts "------ NEW TURN -------"
    puts "Player #{turn}: What does #{num1} plus #{num2} equal?"
    print "> "
    input =  $stdin.gets.chomp.to_i
    if input == num1 + num2
      puts "Player #{turn}: Correct!"
      return true
    else
      puts "Player #{turn}: Incorrect!"
      return false
    end
  end
end 
