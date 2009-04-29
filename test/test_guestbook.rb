require File.dirname(__FILE__) + '/test_helper.rb'
require 'guestbook.rb'

class TestGuestbook < Test::Unit::TestCase
  include Sinatra::Test

  context 'GET /' do
    setup { get '/' }

    should 'be successful' do
      assert response.ok?
    end

    should 'return the text "hello world"' do
      assert_equal 'hello world', response.body
    end
  end
end

