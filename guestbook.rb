require 'rubygems'
require 'sinatra'

get '/' do
  erb :index
end

get '/action' do
  'get'
end

post '/action' do
  'post'
end

put '/action' do
  'put'
end

delete '/action' do
  'delete'
end

