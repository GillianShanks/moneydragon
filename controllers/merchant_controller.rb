require_relative('../models/merchant.rb')

#INDEX
get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

#NEW

#CREATE

#EDIT

#UPDATE

#DELETE

#SHOW
get '/merchants/:id' do
  id=params[:id].to_i()
  @merchant = Merchant.find(id)
  erb(:"merchants/show")
end
