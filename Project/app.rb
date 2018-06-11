require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/transactions_controller')
require_relative('controllers/user_controller')
require_relative('controllers/tag_controllers')
require_relative('controllers/merchant_controller')

get '/' do
  erb(:index)
end