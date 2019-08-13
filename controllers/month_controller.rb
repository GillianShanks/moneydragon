require_relative("../models/month.rb")

#SHOW
get "/months/:id" do
  id=params[:id].to_i()
  @month=Month.find(id)
  erb(:"months/show")
end
