require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag')

get '/tags' do
  @tags = Tag.all()
  erb(:"tags/index")
end

get '/tag/new' do
  erb(:"tags/new")
end

post '/tags' do
  @tag = Tag.new(params)
  @tag.save()
  redirect to "/tags"
end

get '/tag/:id' do
  @tag = Tag.find(params[:id])
  erb(:"tags/show")
end

get '/tag/:id/edit' do
  @tag = Tag.find(params[:id])
  erb(:"tags/edit")
end

post '/tag/:id' do
  @tag = Tag.find(params[:id])
  @tag.update(params)
  redirect to "/tag/#{params[:id]}"
end

post '/tag/:id/delete' do
  @tag = Tag.find(params[:id])
  @tag.delete()
  redirect to "/tags"
end