require("minitest/autorun")
require("minitest/rg")

require_relative("../transaction.rb")

class TransactionTest < MiniTest::Test
  def setup()
    @transaction1 = Transaction.new({
      "amount" => 15
      })
  end

  def test_can_get_amount()
    assert_equal(15, @transaction1.amount)
  end

end
