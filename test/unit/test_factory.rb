require File.join(File.dirname(__FILE__),'unit_test_helper.rb')
require 'test/factory'

class TestFactory < Test::Unit::TestCase
  context 'a factory' do
    should 'build a create method' do
      Factory.expects(:new_foo).returns(stub(:save => nil))
      Factory.build_create_method(:foo)
      Factory.create_foo
    end

    should 'build a new entry with default values' do
      entry = Factory.new_entry
      assert_equal "Drew", entry.name
      assert_equal "Hi", entry.message
    end

    should 'build an entry with provided values' do
      entry = Factory.new_entry :name => 'Ryann'
      assert_equal "Ryann", entry.name
      assert_equal "Hi", entry.message
    end
  end
end
