require 'minitest/autorun'
require 'pry'

class Frankenclass
  def add(numbers)
    sum = 0
    # numbers.each { |number| sum = sum + number }
    numbers.each do |number|
      sum = sum + number
    end
    # return sum
    sum
  end
end

class ArrayTests < Minitest::Test
  def test_can_add_up_numbers
    frank = Frankenclass.new
    assert_equal 20, frank.add([1,5,4,10])
  end
end
