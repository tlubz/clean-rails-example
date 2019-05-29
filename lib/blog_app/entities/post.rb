require_relative '../entities'
require 'ostruct'



class BlogApp::Entities::Post
  ATTRIBUTES = %i[
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
end
