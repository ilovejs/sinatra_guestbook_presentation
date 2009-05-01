require File.join(File.dirname(__FILE__),'unit_test_helper.rb')

class TestEntry < Test::Unit::TestCase
  include Sinatra::Test

  context 'an entry' do
    should 'have a name' do
      entry = Entry.new :name => "Drew", :message => "Zomg a message"
      assert_equal "Drew", entry.name
    end

    should 'not allow blank names' do
      entry = Entry.new :message => 'test message'
      assert_false entry.valid?
    end

    should 'have a message' do
      entry = Entry.new :name => "Drew", :message => "Zomg a message"
      assert_equal "Zomg a message", entry.message
    end

    should 'not allow blank messages' do
      entry = Entry.new :name => 'Drew'
      assert_false entry.valid?
    end
  end
end

