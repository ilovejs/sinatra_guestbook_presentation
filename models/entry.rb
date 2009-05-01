class Entry
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :nullable => false
  property :message, Text, :nullable => false
end
