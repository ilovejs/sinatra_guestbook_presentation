require File.join(File.dirname(__FILE__),'..','test_helper.rb')

module FunctionalTestCase
  def setup
    transaction = DataMapper.repository(:default).transaction
    transaction.begin
    DataMapper.repository(:default).adapter.push_transaction(transaction)
  end

  def teardown
    transaction = DataMapper.repository(:default).adapter.pop_transaction
    transaction.rollback
  end
end

