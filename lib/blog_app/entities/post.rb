require_relative '../entities'
require 'ostruct'

BlogApp::Entities::POST_ATTRIBUTES = %i[
  author
  title
  body
  created_at
  updated_at
]

class BlogApp::Entities::Post < Struct.new(*BlogApp::Entities::POST_ATTRIBUTES)

end
