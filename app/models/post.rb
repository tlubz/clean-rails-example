require './lib/blog_app/entities/post'

class Post < ApplicationRecord
  DOMAIN_OBJECT_CLASS = BlogApp::Entities::Post

  def domain_object
    attrs = attributes.symbolize_keys
    attrs[:created_at] = attrs[:created_at].to_i
    attrs[:updated_at] = attrs[:updated_at].to_i
    DOMAIN_OBJECT_CLASS.new(attrs)
  end
end
