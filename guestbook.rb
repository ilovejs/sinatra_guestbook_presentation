require 'rubygems'
require 'sinatra'
require 'bootstrap'

get '/entries' do
  @entries = Entry.all
  erb :entries
end

