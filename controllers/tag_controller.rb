require_relative("../models/tag.rb")

#INDEX
get '/tags' do
  @tags = Tag.all()
  erb(:"tags/index")
end

#NEW
get '/tags/new' do
  erb(:"tags/new")
end

#CREATE
post '/tags' do
  new_tag=Tag.new(params)
  new_tag.save()
  redirect '/tags'
end

#EDIT


#UPDATE


#DELETE


#SHOW
get '/tags/:id' do
  id = params[:id].to_i()
  @tag = Tag.find(id)
  erb(:"tags/show")
end
