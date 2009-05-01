require File.join(File.dirname(__FILE__),'functional_test_helper.rb')

class TestEntry < Test::Unit::TestCase
  include FunctionalTestCase
  include Sinatra::Test

  context 'an entry' do
    should 'true' do
      assert true
    end
  end
end

