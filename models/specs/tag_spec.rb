require("minitest/autorun")
require("minitest/rg")

require_relative("../tag.rb")

class TagTest < MiniTest::Test

  def setup()
    @tag1 = Tag.new({
      "type" => "entertainment"
      })
  end

  def test_can_get_type()
    assert_equal("entertainment", @tag1.type)
  end

  


end
