require './lib/blog_app/repos/posts_repo'

class ActiverecordPostsRepo < BlogApp::Repos::PostsRepo
  def create(post)
    Post.create!(post.to_h)
    post
  end
end
