require_relative '../use_cases'

class BlogApp::UseCases::ListPosts
  def initialize(posts_repo:, events_repo:)
    @posts_repo = posts_repo
    @events_repo = events_repo
  end

  def execute
    @events_repo.log(:list, doc_type: :post)
    @posts_repo.list
  end
end
