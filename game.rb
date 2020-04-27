require_relative './players'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player1, @player2]
    @round = 1
  end

  def display_round_status
    puts "---------------"
    puts "Round #{@round}"
    puts "---------------"
    @players.each{|player| puts "#{player.name} has #{player.lives} lives"}
  end

  def winner
    @players.select{|player| player.lives > 0}
  end

  def display_winner
    puts "The winner is #{winner.first.name}"
  end

   def game_over?
    if @players.first.lives == 0 || @players.last.lives === 0
      true
    else
      false
    end
  end

  def next_round
    @round += 1
    sleep 1
    @players.rotate!
  end

  def ask_question
    num1 = rand(1...20)
    num2 = rand(1...20)
    result = num1 + num2
    puts "What is #{num1} + #{num2}?"
    answer = gets.chomp
    if answer.to_i == result
      puts "That's correct!"
      true
    else
      puts "That's wrong! You lose a life."
      @players.first.lives -= 1
      false
    end
  end

  def play
    until game_over? do
      current_player = @players.first
      display_round_status
      ask_question
      next_round
    end
    display_winner
  end
end



