require 'rails_helper'

require './lib/blog_app/entities/post'
require './lib/blog_app/use_cases/add_post'

RSpec.describe PostsController do
  describe 'POST create' do
    subject(:call) do
      post :create, params: { post: params }
    end

    let(:params) do
      {
        author: 'fred fake',
        title: 'fake title',
        body: 'here is a fake message body.'
      }
    end

    let(:result) { BlogApp::Entities::Post.new(params) }
    let(:use_case) do
      instance_double(BlogApp::UseCases::AddPost, execute: result)
    end

    before do
      allow(BlogApp::UseCases::AddPost).to receive(:new).and_return(use_case)
    end

    it 'executes the add-post use-case' do
      call
      expect(use_case).to have_received(:execute).with(kind_of(BlogApp::Entities::Post))
    end

    it 'serializes and renders the response' do
      call

      expected = params
      expect(Oj.load(response.body, symbol_keys: true)).to eq(expected)
    end
  end
end
