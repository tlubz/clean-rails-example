require './lib/blog_app/repos/posts_repo'
require './lib/blog_app/entities/post'

class ActiverecordPostsRepo < BlogApp::Repos::PostsRepo
  def create(post)
    Post.create!(post.to_h).domain_object
  end

  def list
    Post.all.map(&:domain_object)
  end
end
