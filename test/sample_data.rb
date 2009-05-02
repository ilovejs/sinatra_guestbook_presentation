require 'db/db'

class SampleData
  def self.load
    5.times do
      Entry.create :name => "drew", :message => "hi"
    end
  end
end
