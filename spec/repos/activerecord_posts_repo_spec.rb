require 'rails_helper'
require './lib/blog_app/entities/post'

RSpec.describe ActiverecordPostsRepo do
  describe '#create' do
    let(:domain_obj) { BlogApp::Entities::Post.new(author: 'a', title: 'b', body: 'c') }

    it 'puts a new post in the database' do
      subject.create(domain_obj)
      post = Post.last
      expect(post.author).to eq('a')
      expect(post.title).to eq('b')
      expect(post.body).to eq('c')
    end

    it 'returns the created post' do
      expect(subject.create(domain_obj)).to eq(domain_obj)
    end
  end
end
