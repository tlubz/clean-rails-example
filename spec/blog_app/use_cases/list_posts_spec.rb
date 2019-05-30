require './lib/blog_app/use_cases/list_posts'
require './lib/blog_app/entities/post'
require './lib/blog_app/repos/posts_repo'
require './lib/blog_app/repos/events_repo'

RSpec.describe BlogApp::UseCases::ListPosts do
  subject(:use_case) do
    described_class.new(posts_repo: posts_repo, events_repo: events_repo)
  end

  let(:post_list_response) { double('response') }
  let(:posts_repo) { instance_double(BlogApp::Repos::PostsRepo, list: post_list_response) }
  let(:events_repo) { instance_double(BlogApp::Repos::EventsRepo, log: nil) }

  describe '#execute' do
    subject(:result) do
      use_case.execute
    end

    it 'lists the posts using the posts repo' do
      result
      expect(posts_repo).to have_received(:list)
    end

    it 'logs an event to the events repo' do
      result
      expect(events_repo).to have_received(:log).with(:list, doc_type: :post)
    end

    it 'returns the response' do
      expect(result).to eq(post_list_response)
    end
  end
end
