require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-aggregates'
require 'fileutils'

FileUtils.mkdir("db") unless File.exist?("db")

DataMapper.setup(
  :default, 
  "sqlite3://#{File.expand_path(File.dirname(__FILE__))}/db/#{Sinatra::Application.environment}.db"
)

