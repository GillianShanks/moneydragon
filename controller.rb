require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
also_reload('./models/*')

require_relative('./controllers/merchant_controller.rb')
require_relative('./controllers/tag_controller.rb')
require_relative('./controllers/transaction_controller.rb')
require_relative('./controllers/month_controller.rb')
require_relative('./controllers/budget_controller.rb')

get '/' do
  erb(:home)
end
