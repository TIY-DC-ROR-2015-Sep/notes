require 'pry'

class Game
  def initialize
    @answer = rand(1 .. 10)
  end

  def over?
    if @guessed_correct_answer
      true
    else
      false
    end
  end

  def check_guess guessed_number
    if guessed_number == @answer
      puts "Guessed correctly!"
      @guessed_correct_answer = true
    elsif guessed_number > @answer
      puts "Your guess was high"
    else
      puts "Your guess was low"
    end
  end
end


g = Game.new # starts game w/ rand # 1..50
puts "Guess a random number between 1 and 50"

until g.over?
  puts "What is your guess?"
  guess = gets.chomp.to_i
  g.check_guess guess
end
