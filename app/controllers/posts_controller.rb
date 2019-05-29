require './lib/blog_app/use_cases/add_post'
require './lib/blog_app/entities/post'

class PostsController < ApplicationController
  # POST /posts
  # POST /posts.json
  def create
    use_case = BlogApp::UseCases::AddPost.new(
      posts_repo: ActiverecordPostsRepo.new,
      events_repo: LogEventsRepo.new
    )
    result = use_case.execute(BlogApp::Entities::Post.new(post_params))
    render json: PostsSerializer.new(result).as_json
  end

  def post_params
    params.permit(:author, :title, :body)
  end
end
