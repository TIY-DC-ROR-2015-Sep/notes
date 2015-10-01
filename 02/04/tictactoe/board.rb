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
    if @state[position].is_a? Fixnum
      @state[position] = letter
    end
  end
end
