require 'pry'

class Board
  def initialize
    @state = {}
    (1..9).each { |n| @state[n] = n }
  end

  def read position
    @state[position]
  end

  def record_move letter, position
    @state[position] = letter
  end
end
