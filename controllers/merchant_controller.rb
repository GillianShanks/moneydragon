require_relative('../models/merchant.rb')

#INDEX
get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchant/index")
end

#SHOW

#NEW

#CREATE

#EDIT

#UPDATE

#DELETE
