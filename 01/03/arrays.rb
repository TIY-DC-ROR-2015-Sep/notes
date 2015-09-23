require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require 'pry'

class Frankenclass
  def add(numbers)
    sum = 0
    # numbers.each { |number| sum = sum + number }
    numbers.each do |number|
      # sum = sum + number
      sum += number
    end
    # return sum
    sum
  end

  def double(numbers)
    result = []
    numbers.each do |n|
      result.push(n * 2)
    end
    result
  end
end

class ArrayTests < Minitest::Test
  def test_can_add_up_numbers
    frank = Frankenclass.new
    assert_equal 20, frank.add([1,5,4,10])
  end

  def test_can_double_numbers
    frank = Frankenclass.new
    assert_equal [10,-4,14], frank.double([5,-2,7])
  end
end
