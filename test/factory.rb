require 'db/db'

class Factory
  def self.build_create_method(name)
    class << self; self; end.instance_eval do
      define_method("create_#{name}") do
        self.send("new_#{name}").save
      end
    end
  end

  build_create_method :entry
  def self.new_entry(options={})
    default_values = {
      :name => "Drew",
      :message => "Hi"
    }
    Entry.new default_values.merge(options)
  end
end
