require_relative('../models/transaction.rb')

#INDEX
get '/spending' do
  @spending = Transaction.all()
  erb(:"transactions/index")
end

#NEW
get '/spending/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  @months = Month.all()
  @budgets = Budget.all()
  erb(:"transactions/new")
end

#CREATE
post '/spending' do
  spending=Transaction.new(params)
  spending.save()
  redirect("/budgets")
end

#MONTHLY INDEX
get '/spending/by_month' do
  @months = Month.all()
  erb(:"transactions/by_month")
end

#EDIT
get '/spending/:id/edit' do
  id=params[:id].to_i()
  @spend=Transaction.find(id)
  @merchants = Merchant.all()
  @tags = Tag.all()
  @months=Month.all()
  @budgets = Budget.all()
  erb(:"transactions/edit")
end

#UPDATE
post '/spending/:id' do
  spend=Transaction.new(params)
  spend.update()
  redirect('/budgets')
end

#DELETE
post '/spending/:id/delete' do
  id=params[:id].to_i()
  spend=Transaction.find(id)
  spend.delete()
  redirect('/budgets')
end
