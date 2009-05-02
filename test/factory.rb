require 'db/db'

class Factory
  def self.build_create_method(name)
    class << self; self; end.instance_eval do
      define_method("create_#{name}") do
        instance = self.send("new_#{name}")
        instance.save
        instance
      end
    end
  end

  build_create_method :entry
  def self.new_entry(options={})
    default_values = {
      :name => "Drew",
      :message => "Hi"
    }
    entry = Entry.new default_values.merge(options)
    entry.comments << new_comment
    entry
  end

  build_create_method :comment
  def self.new_comment(options={})
    default_values = {
      :body => 'A comment'
    }
    Comment.new default_values.merge(options)
  end
end
