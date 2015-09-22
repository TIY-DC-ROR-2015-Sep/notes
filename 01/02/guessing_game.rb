require 'pry'

class Game
  def initialize
    @max = 10 # <- one source of truth for the max
    @answer = rand(1 .. @max)
    @guesses_left = 5
  end

  def max
    @max
  end

  # attr_reader :guesses_left
  def guesses_left
    @guesses_left
  end

  def over?
    if @guessed_correct_answer
      true
    elsif @guesses_left == 0
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
      @guesses_left = @guesses_left - 1
    else
      puts "Your guess was low"
      @guesses_left = @guesses_left - 1
    end
  end
end


g = Game.new
puts "Guess a random number between 1 and #{g.max}"

until g.over?
  puts "You have #{g.guesses_left} guesses left"
  puts "What is your guess?"
  guess = gets.chomp.to_i
  g.check_guess guess
end
