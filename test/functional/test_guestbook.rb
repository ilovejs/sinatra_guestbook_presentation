require File.join(File.dirname(__FILE__),'functional_test_helper.rb')
require 'guestbook.rb'

class TestGuestbook < Test::Unit::TestCase
  include FunctionalTestCase
  include Sinatra::Test

  context 'GET on /entries' do
    should 'return a list of entries' do
      assert true
    end
  end
end

