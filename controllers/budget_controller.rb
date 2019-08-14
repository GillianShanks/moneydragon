require_relative('../models/budget.rb')

#INDEX
get '/budgets' do
  @budgets = Budget.all()
  erb(:"budgets/index")
end


#NEW
get '/budgets/new' do
  erb(:"budgets/new")
end

#CREATE
post '/budgets' do
  budget=Budget.new(params)
  budget.save()
  redirect("/budgets")
end

#BY MONTH
get '/budgets/:id/by_month' do
  id=params[:id].to_i()
  @budget=Budget.find(id)
  @months=Month.all()
  erb(:"budgets/by_month")
end

#EDIT
get '/budgets/:id/edit' do
  id = params[:id].to_i()
  @budget = Budget.find(id)
  erb(:"budgets/edit")
end

#UPDATE
post '/budgets/:id' do
  budget=Budget.new(params)
  budget.update()
  redirect ("/budgets/#{budget.id}")
end

#DELETE
post '/budgets/:id/delete' do
  budget=Budget.new(params)
  budget.delete()
  redirect("/budgets")
end


#SHOW
get '/budgets/:id' do
  id=params[:id].to_i()
  @budget=Budget.find(id)
  erb(:"budgets/show")
end
