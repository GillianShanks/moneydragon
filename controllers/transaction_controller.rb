require_relative('../models/transaction.rb')

#INDEX
get '/spending' do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end

#NEW


#CREATE


#EDIT


#UPDATE


#DELETE


#SHOW
