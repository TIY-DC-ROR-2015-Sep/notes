require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require './board'

class BoardTest < Minitest::Test
  def test_can_record_move
    b = Board.new
    assert_equal 5, b.read(5)
    b.record_move :x, 5
    assert_equal :x, b.read(5)
  end

  def test_overwriting
    b = Board.new
    b.record_move :o, 2
    b.record_move :x, 2
    assert_equal :o, b.read(2)
  end
end
