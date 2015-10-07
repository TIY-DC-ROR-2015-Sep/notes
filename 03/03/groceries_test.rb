ENV['RACK_ENV'] = 'test'

require "minitest/autorun"
require "rack/test"
require "pry"

require "./groceries"

class GroceriesTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Groceries
  end

  def test_starts_with_three_items
    r = get "/groceries"
    body = JSON.parse(r.body)
    assert_equal ["apples", "bananas", "carrots"], body
  end

  # def test_can_delete_an_item
  #   r = delete "/groceries", name: "bananas"
  #   assert_equal 200, r.status
  #
  #   r = get "/groceries"
  #   body = JSON.parse(r.body)
  #   # assert ! body.include?("bananas")
  #   refute_includes body, "bananas"
  # end

  def test_trying_to_delete_non_item
    r = delete "/groceries", name: "not a thing"
    assert_equal 404, r.status
  end
end
