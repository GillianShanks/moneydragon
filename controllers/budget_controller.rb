require_relative('../models/budget.rb')

get '/budgets' do
  @budgets = Budget.all()
  erb(:"budgets/index")
end
