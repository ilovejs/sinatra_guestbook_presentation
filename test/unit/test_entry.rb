require File.join(File.dirname(__FILE__),'unit_test_helper.rb')

class TestEntry < Test::Unit::TestCase
  context 'an entry' do
    should 'have a name' do
      entry = Factory.new_entry
      assert_equal "Drew", entry.name
    end

    should 'not allow blank names' do
      entry = Factory.new_entry :name => nil
      assert_false entry.valid?
    end

    should 'have a message' do
      entry = Factory.new_entry
      assert_equal "Hi", entry.message
    end

    should 'not allow blank messages' do
      entry = Factory.new_entry :message => nil
      assert_false entry.valid?
    end

    should 'have comments' do
      entry = Factory.new_entry 
      assert_equal 1, entry.comments.size
    end
  end
end

