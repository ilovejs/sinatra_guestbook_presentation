$:.unshift File.dirname(__FILE__)
$:.unshift File.join(File.dirname(__FILE__),'sinatra','sinatra-0.9.1.1','lib')
require 'sinatra'

Sinatra::Application.set :run, false
Sinatra::Application.set :environment, :production

require 'guestbook'

run Sinatra::Application

