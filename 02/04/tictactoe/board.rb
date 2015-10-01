require 'pry'

class Board
  def initialize
    @state = {}
    (1..9).each { |n| @state[n] = n }
  end

  def read position
    @state[position.to_i]
  end

  def record_move letter, position
    if @state[position.to_i].is_a? Fixnum
      @state[position.to_i] = letter
    end
  end

  def display
    [
      [1,2,3],
      [4,5,6],
      [7,8,9]
    ].each do |row|
      puts "#{@state[row[0]]} | #{@state[row[1]]} | #{@state[row[2]]}"
    end
  end

  def done?
    won? || draw?
  end

  def won?
    winning_combinations.each do |combination|
      # combination.map { |p| read(p) }.uniq.length == 1
      if read(combination[0]) == read(combination[1]) && read(combination[1]) == read(combination[2])
        return true
      end
    end
    return false
  end

  def draw?
    @state.values.none? { |val| val.is_a? Fixnum } && !won?
  end

  def winning_combinations
    [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7]
    ]
  end
end
