require 'test/factory'

class SampleData
  def self.load
    5.times do
      Factory.create_entry
    end
  end
end
