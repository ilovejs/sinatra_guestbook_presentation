require File.join(File.dirname(__FILE__),'test_helper.rb')
require 'guestbook.rb'

class TestGuestbook < Test::Unit::TestCase
  include Sinatra::Test

  context 'GET /' do
    setup { get '/' }

    should 'be successful' do
      assert response.ok?
    end
  end

  context 'GET /action' do
    setup { get '/action' }

    should 'be successful' do
      assert response.ok?
    end

    should 'return the text get' do
      assert response.body.include?('get')
    end
  end

  context "POST /action" do
    setup { post '/action' }

    should 'be successful' do
      assert response.ok?
    end

    should 'return the text post' do
      assert response.body.include?('post')
    end
  end

  context "PUT /action" do
    setup { put '/action' }

    should 'be successful' do
      assert response.ok?
    end

    should 'return the text put' do
      assert response.body.include?('put')
    end
  end

  context "DELETE /action" do
    setup { delete '/action' }

    should 'be successful' do
      assert response.ok?
    end

    should 'return the text delete' do
      assert response.body.include?('delete')
    end
  end

  context 'GET /hello/:name' do
    setup { get '/hello/drew' }

    should 'return the name drew' do
      assert response.body.include?('drew')
    end
  end

  context 'GET with a phone number pattern' do
    setup { get '/123-456-7890' }

    should 'include the area code' do
      assert response.body.include?('area code - 123')
    end

    should 'include the prefix' do
      assert response.body.include?('prefix - 456')
    end

    should 'include the sufix' do
      assert response.body.include?('sufix - 7890')
    end
  end
end

