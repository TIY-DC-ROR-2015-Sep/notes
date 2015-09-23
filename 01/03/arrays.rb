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

  def take_evens all_numbers
    result = []
    all_numbers.each do |x|
      if x.even?
        result.push x
      end
    end
    result
  end

  def partition_evens all_numbers
      evens, odds = [], []
      all_numbers.each do |x|
        if x.even?
          evens.push x
        else
          odds.push x
        end
      end
      [ evens, odds ]
    end

  def all_are_big numbers
    numbers.each do |i|
      if i < 50
        return false
      end
    end
    true
  end

  def any_are_big ns
    ns.each do |num|
      if num > 50
        return true
      end
    end
    false
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

  def test_can_select_numbers
    frank = Frankenclass.new
    nums = (1..10).to_a
    assert_equal [2,4,6,8,10], frank.take_evens(nums)
  end

  def test_can_partition_numbers
    frank = Frankenclass.new
    nums = (1..6).to_a
    assert_equal [ [2,4,6], [1,3,5] ], frank.partition_evens(nums)
  end

  def test_can_check_all
    frank = Frankenclass.new
    assert frank.all_are_big([500, 100, 333])
    refute frank.all_are_big([500, 49, 2245, 92498234])
  end

  def test_can_check_any
    frank = Frankenclass.new
    assert frank.any_are_big([500, 100, 333])
    assert frank.any_are_big([1,2,3,4,5,100_000_000])
    assert frank.any_are_big([500, 49, 2245, 92498234])
    refute frank.any_are_big((1..49).to_a)
  end
end
