require File.join(File.dirname(__FILE__),'functional_test_helper.rb')

class TestFactory < Test::Unit::TestCase
  include FunctionalTestCase

  context 'a factory' do
    should 'create a member of the intended class' do
      entry = Factory.create_entry
      assert_equal Entry, entry.class
    end
  end
end

