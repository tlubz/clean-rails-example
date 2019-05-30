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

    it 'returns the created post, with id and timestamps' do
      response = subject.create(domain_obj)
      post = Post.last
      expected_response = BlogApp::Entities::Post.new(
        author: domain_obj.author,
        title: domain_obj.title,
        body: domain_obj.body,
        id: post.id,
        created_at: post.created_at.to_i,
        updated_at: post.updated_at.to_i
      )
      expect(response).to eq(expected_response)
    end
  end

  describe '#list' do
    it 'returns a collection of all posts' do
      attrs_list = [
        {author: 'a', title: 'b', body: 'c'},
        {author: 'd', title: 'e', body: 'f'}
      ]

      attrs_list.each do |attrs|
        Post.create!(attrs)
      end

      actual_attrs_list = subject.list.map do |post|
        expect(post).to be_a(BlogApp::Entities::Post)
        post.to_h.slice(:author, :title, :body)
      end
      expect(actual_attrs_list).to contain_exactly(*attrs_list)
    end
  end
end
