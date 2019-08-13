require('minitest/autorun')
require('minitest/rg')
require_relative('../budget.rb')

class BudgetTest < MiniTest::Test
  def setup()
    @budget=Budget.new({
      "total"=>600
      })
  end

  def test_can_get_total_budget()
    assert_equal(600, @budget.total)
  end

  def test_can_get_monthly_budget()
    assert_equal(50, @budget.monthly)
  end
end
