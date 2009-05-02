class Comment
  include DataMapper::Resource

  property :id, Serial
  property :body, String, :nullable => false

  belongs_to :entry
end

