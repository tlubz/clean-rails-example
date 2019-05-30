require_relative '../entities'

class BlogApp::Entities::Post
  ATTRIBUTES = %i[
    id
    author
    title
    body
    created_at
    updated_at
  ]
  attr_accessor *ATTRIBUTES

  def initialize(attrs = {})
    ATTRIBUTES.each do |attr|
      instance_variable_set("@#{attr}", attrs[attr]) if attrs[attr]
    end
  end

  def to_h
    ATTRIBUTES.reduce({}) do |memo, attr|
      memo[attr] = instance_variable_get("@#{attr}")
      memo
    end
  end

  def ==(other)
    return false unless other.class == self.class
    ATTRIBUTES.all? do |attr|
      self.send(attr) == other.send(attr)
    end
  end
end
