class Comment
  include DataMapper::Resource

  property :id, Serial
  property :body, Text, :nullable => false

  belongs_to :entry
end

