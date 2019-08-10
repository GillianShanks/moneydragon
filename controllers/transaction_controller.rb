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
  erb(:"transactions/new")
end

#CREATE
post '/spending' do
  spending=Transaction.new(params)
  spending.save()
  redirect("/spending")
end

#EDIT


#UPDATE


#DELETE


#SHOW
