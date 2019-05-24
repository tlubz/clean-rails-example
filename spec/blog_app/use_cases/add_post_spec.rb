require './lib/blog_app/use_cases/add_post'
require './lib/blog_app/entities/post'
require './lib/blog_app/repos/posts_repo'
require './lib/blog_app/repos/events_repo'

RSpec.describe BlogApp::UseCases::AddPost do
  subject(:use_case) do
    described_class.new(posts_repo: posts_repo, events_repo: events_repo)
  end

  let(:post_create_response) { double('response') }
  let(:posts_repo) { instance_double(BlogApp::Repos::PostsRepo, create: post_create_response) }
  let(:events_repo) { instance_double(BlogApp::Repos::EventsRepo, log: nil) }

  describe '#execute' do
    subject(:result) do
      use_case.execute(post)
    end

    let(:post) do
      BlogApp::Entities::Post.new
    end

    it 'adds the post to the posts repo' do
      result
      expect(posts_repo).to have_received(:create).with(post)
    end

    it 'logs an event to the events repo' do
      result
      expect(events_repo).to have_received(:log).with(:create, post)
    end

    it 'returns the response' do
      expect(result).to eq(post_create_response)
    end
  end
end
