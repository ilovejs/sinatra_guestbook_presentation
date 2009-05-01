require 'bootstrap'

get '/' do
  erb :index
end

get '/action' do
  erb :get
end

post '/action' do
  erb :post
end

put '/action' do
  erb :put
end

delete '/action' do
  erb :delete
end

get '/hello/:name' do
  @name = params[:name]

  erb :hello_name
end

get '/*/is/*' do
  @noun = params[:splat][0]
  @adjective = params[:splat][1]

  erb :is
end

get %r|/(\d{3})-(\d{3})-(\d{4})| do
  @area_code = params[:captures][0]
  @prefix = params[:captures][1]
  @sufix = params[:captures][2]

  erb :phone
end

