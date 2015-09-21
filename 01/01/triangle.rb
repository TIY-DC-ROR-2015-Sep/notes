require 'minitest/autorun'
require 'pry'

class Triangle
  attr_accessor :a, :b, :c

  def initialize first, second, third
    self.a = first
    self.b = second
    self.c = third
  end

  def perimeter
    # self.a + self.b + self.c
    a + b + c
  end

  def type
    if a == b && b == c
      "equilateral"
    elsif a == b || b == c || a == c
      "isosceles"
    else
      "scalene"
    end
  end
end

class TriangleTest < Minitest::Test
  def test_triangles_can_determine_their_sides
    t = Triangle.new(3,4,5)
    # t.a => 3
    assert_equal 3, t.a
  end

  def test_triangles_have_a_perimeter
    t = Triangle.new(5,12,13)
    assert_equal 30, t.perimeter
  end

  def test_equilateral_triangles
    t = Triangle.new(3,3,3)
    assert_equal "equilateral", t.type

    s = Triangle.new(5,5,8)
    assert_equal "isosceles", s.type

    u = Triangle.new(5,7,5)
    assert_equal "isosceles", u.type
  end
end
