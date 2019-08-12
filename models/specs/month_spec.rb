require("minitest/autorun")
require("minitest/rg")

require_relative("../month.rb")

class MonthTest < MiniTest::Test

  def setup()
    @month1 = Month.new({
      "name" => "January",
      "order" => 1
      })
  end

  def test_can_get_name()
    assert_equal("January", @month1.name)
  end

  def test_can_get_order()
    assert_equal(1, @month1.order)
  end

end
