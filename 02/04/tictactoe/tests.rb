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
end
