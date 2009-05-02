require File.join(File.dirname(__FILE__),'unit_test_helper.rb')

class TestComment < Test::Unit::TestCase
  context 'a comment' do
    should 'have a body' do
      comment = Factory.new_comment
      assert_equal 'A comment', comment.body
    end

    should 'not allow a null body' do
      comment = Factory.new_comment :body => nil
      assert_false comment.valid?
    end
  end
end

