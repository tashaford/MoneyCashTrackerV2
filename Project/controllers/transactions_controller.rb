require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative '../models/transaction'
require_relative '../models/months'

get '/transactions' do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end

get '/transaction/new' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  @users = User.all()
  erb(:"transactions/new")
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect to "/transactions"
end

get '/transaction/total' do
  @months = Months.all()
  @transactions = Transaction.all()
  @amount = Transaction.total()
  @tags = Tag.all()
  erb(:"transactions/show_total")
end

get '/transaction/total/month/' do
  @month_amount = Transaction.total_month(params[:month_num].to_i)
  erb(:"transactions/show_total_month")
end

get '/transaction/total/:tag_id' do
  @tag = Tag.find(params[:tag_id])
  @amount_tag = Transaction.total_tag(params[:tag_id].to_i)
  erb(:"transactions/show_total_tag")
end

get '/transaction/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/show")
end

get '/transaction/:id/edit' do
  @transaction = Transaction.find(params[:id])
  @tags= Tag.all()
  @merchants = Merchant.all()
  @users = User.all()
  erb(:"transactions/edit")
end

post '/transaction/:id' do
  @transaction = Transaction.find(params[:id])
  @transaction.update(params)
  redirect to "/transaction/#{params[:id]}"
end

post '/transaction/:id/delete' do
  @transaction = Transaction.find(params[:id])
  @transaction.delete()
  redirect to "/transactions"
end