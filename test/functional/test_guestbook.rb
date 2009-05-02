require File.join(File.dirname(__FILE__),'functional_test_helper.rb')
require 'guestbook.rb'

class TestGuestbook < Test::Unit::TestCase
  include FunctionalTestCase
  include Sinatra::Test

  context 'GET on /entries' do
    should 'return a list of entries' do
      2.times { Factory.create_entry }

      get '/entries'

      doc = Hpricot(response.body)
      assert_equal 2, (doc/'div.entry').size
    end
  end
end

