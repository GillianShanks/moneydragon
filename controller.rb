require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
also_reload('./models/*')


get '/' do
  erb(:home)
end
