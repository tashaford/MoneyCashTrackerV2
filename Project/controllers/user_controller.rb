require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/user.rb')

get '/users' do
  @users = User.all()
  erb(:"users/index")
end