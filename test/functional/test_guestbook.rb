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

  context 'GET on /entry/:id' do
    should 'return a single entry' do
      entry = Factory.create_entry

      get "/entry/#{entry.id}"

      doc = Hpricot(response.body)
      assert_equal 1, (doc/'div.entry').size
    end

    should 'contain the correct name and message' do
      entry = Factory.create_entry

      get "/entry/#{entry.id}"

      assert response.body.include?('Drew')
      assert response.body.include?('Hi')
    end

    context 'with a format' do
      should 'return the xml representation of an entry' do
        entry = Factory.create_entry

        get "/entry/#{entry.id}.xml"

        assert_equal entry.to_xml, response.body
      end

      should 'return the json representation of an entry' do
        entry = Factory.create_entry

        get "/entry/#{entry.id}.json"

        assert_equal entry.to_json, response.body
      end
    end
  end

  context 'GET on /entry/:id/edit' do
    should 'provide a form to edit the given entry' do
      entry = Factory.create_entry

      get "/entry/#{entry.id}/edit"

      doc = Hpricot(response.body)
      assert_equal 1, (doc/'div.entry-form').size
    end    

    should 'contain the correct name and message' do
      entry = Factory.create_entry

      get "/entry/#{entry.id}/edit"

      assert response.body.include?('Drew')
      assert response.body.include?('Hi')
    end
  end

  context 'GET on /entry/new' do
    should 'provide a form to create a new entry' do
      get "/entry/new"

      doc = Hpricot(response.body)
      assert_equal 1, (doc/'div.entry-form').size
    end    
  end

  context 'PUT on /entry/:id' do
    should 'update the given entry' do
      entry = Factory.create_entry
      put "/entry/#{entry.id}", :id => entry.id, :name => "Ryann", :message => "New message"
      entry.reload

      assert_equal "Ryann", entry.name
      assert_equal "New message", entry.message
    end
  end

  context 'POST on /entry' do
    should 'create a new entry' do
      post '/entry', :name => "Sam", :message => "Stuff"
      assert_not_nil Entry.first(:name => "Sam")
    end
  end

  context 'DELETE on /entry/:id' do
    should 'delete the entry' do
      entry = Factory.create_entry
      delete "/entry/#{entry.id}"
      assert Entry.first(entry.id).empty?
    end
  end
end

