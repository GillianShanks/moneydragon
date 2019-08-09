require("minitest/autorun")
require("minitest/rg")

require_relative("../merchant.rb")

class MerchantTest < MiniTest::Test

  def setup ()
    @merchant1 = Merchant.new({
      "name" => "Amazon"
      })

  end

  def test_can_get_name()
    assert_equal("Amazon", @merchant1.name)
  end

end
