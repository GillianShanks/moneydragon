require_relative('../models/budget.rb')

#INDEX
get '/budgets' do
  @budgets = Budget.all()
  erb(:"budgets/index")
end

#NEW

#CREATE

#EDIT

#UPDATE

#DELETE

#SHOW
get '/budgets/:id' do
  id=params[:id].to_i()
  @budget=Budget.find(id)
  erb(:"budgets/show")
end
