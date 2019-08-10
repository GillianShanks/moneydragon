require_relative('../models/merchant.rb')

#INDEX
get '/places' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

#NEW
get '/places/new' do
  erb(:"merchants/new")
end

#CREATE
post '/places' do
  new_merchant=Merchant.new(params)
  new_merchant.save()
  redirect '/places'
end

#EDIT
get '/places/:id/edit' do
  id = params[:id].to_i()
  @merchant = Merchant.find(id)
  erb(:"merchants/edit")
end

#UPDATE
post "/places/:id" do
  merchant = Merchant.new(params)
  merchant.update()
  redirect "/places/#{merchant.id}"
end

#DELETE
post "/places/:id/delete" do
  id = params[:id].to_i()
  merchant = Merchant.find(id)
  merchant.delete()
  redirect "/places"
end

#SHOW
get '/places/:id' do
  id=params[:id].to_i()
  @merchant = Merchant.find(id)
  erb(:"merchants/show")
end
