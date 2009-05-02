require 'rubygems'
require 'sinatra'
require 'db/db'

get '/entries' do
  @entries = Entry.all
  erb :entries
end

get '/entry/new' do
  erb :entry_new
end

get '/entry/:id.:format' do
  @entry = Entry.first(:id => params[:id])

  if params[:format] == 'json'
    @entry.to_json
  elsif params[:format] == 'xml'
    @entry.to_xml
  else
    erb :entry
  end
end

get '/entry/:id' do
  @entry = Entry.first(:id => params[:id])
  erb :entry
end

get '/entry/:id/edit' do
  @entry = Entry.first(:id => params[:id])
  erb :entry_edit
end

put '/entry/:id' do
  @entry = Entry.first(:id => params[:id])
  
  @entry.update_attributes(
    :name => params[:name],
    :message => params[:message]
  )

  erb :entry
end

delete '/entry/:id' do
  entry = Entry.first(:id => params[:id])
  entry.destroy
  @entries = Entry.all
  erb :entries
end

post '/entry' do
  @entry = Entry.create(params)
  erb :entry
end

