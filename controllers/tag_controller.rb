require_relative("../models/tag.rb")

#INDEX
get "/tags" do
  @tags = Tag.all()
  erb(:"tags/index")
end

#NEW


#CREATE


#EDIT


#UPDATE


#DELETE


#SHOW
get '/tags/:id' do
  id = params[:id].to_i()
  @tag = Tag.find(id)
  erb(:"tags/show")
end
