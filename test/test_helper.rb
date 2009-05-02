base_dir = File.expand_path(File.join(File.dirname(__FILE__),'..'))
$LOAD_PATH.unshift base_dir 

require 'test/unit'
require 'rubygems'
require 'shoulda'
require 'sinatra/test'
require 'sinatra'
require 'bootstrap'
require 'test/factory'

set :environment, :test
set :views, File.join(base_dir,'views')

DataMapper.auto_migrate!

class Test::Unit::TestCase
  def assert_false(value)
    assert !value, "<#{value}> is not <false>" 
  end
end

