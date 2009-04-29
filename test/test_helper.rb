$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__),'..'))

require 'test/unit'
require 'rubygems'
require 'shoulda'
require 'sinatra/test'
require 'sinatra'

set :environment, :test

