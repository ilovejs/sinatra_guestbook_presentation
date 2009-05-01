require File.join(File.dirname(__FILE__),'functional_test_helper.rb')
require 'guestbook.rb'

class TestGuestbook < Test::Unit::TestCase
  include FunctionalTestCase
  include Sinatra::Test

  context 'GET on /entries' do
    should 'return a list of entries' do
      Entry.create :name => "Drew", :message => "Hi!"
      Entry.create :name => "Ryann", :message => "Howdy."

      get '/entries'

      doc = Hpricot(response.body)
      assert_equal 2, (doc/'div.entry').size
    end
  end
end

