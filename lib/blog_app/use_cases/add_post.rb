require_relative '../use_cases'

class BlogApp::UseCases::AddPost
  def initialize(posts_repo:, events_repo:)
    @posts_repo = posts_repo
    @events_repo = events_repo
  end

  def execute(post)
    @events_repo.log(:create, post)
    @posts_repo.create(post)
  end
end
