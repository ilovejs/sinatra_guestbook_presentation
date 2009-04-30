require File.join(File.dirname(__FILE__),'test_helper.rb')
require 'guestbook.rb'

class TestGuestbook < Test::Unit::TestCase
  include Sinatra::Test

  context 'GET /' do
    setup { get '/' }

    should 'be successful' do
      assert response.ok?
    end

    should 'return the text "hello world"' do
      assert response.body.include?('hello world')
    end
  end

  context 'GET /action' do
    setup { get '/action' }

    should 'be successful' do
      assert response.ok?
    end

    should 'return the text get' do
      assert_equal response.body, 'get'
    end
  end

  context "POST /action" do
    setup { post '/action' }

    should 'be successful' do
      assert response.ok?
    end

    should 'return the text get' do
      assert_equal response.body, 'post'
    end
  end

  context "PUT /action" do
    setup { put '/action' }

    should 'be successful' do
      assert response.ok?
    end

    should 'return the text get' do
      assert_equal response.body, 'put'
    end
  end

  context "DELETE /action" do
    setup { delete '/action' }

    should 'be successful' do
      assert response.ok?
    end

    should 'return the text get' do
      assert_equal response.body, 'delete'
    end
  end
end

