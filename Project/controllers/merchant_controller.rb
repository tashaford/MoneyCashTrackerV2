require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant')

get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

get '/merchant/new' do
  erb(:"merchants/new")
end

post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save()
  redirect to "/merchants"
end

get '/merchant/:id' do
  @merchant = Merchant.find(params[:id])
  erb(:"merchants/show")
end

get '/merchant/:id/edit' do
  @merchant = Merchant.find(params[:id])
  erb(:"merchants/edit")
end

post '/merchant/:id' do
  @merchant = Merchant.find(params[:id])
  @merchant.update(params)
  redirect to "/merchant/#{params[:id]}"
end

post '/merchant/:id/delete' do
  @merchant = Merchant.find(params[:id])
  @merchant.delete()
  redirect to "/merchants"
end