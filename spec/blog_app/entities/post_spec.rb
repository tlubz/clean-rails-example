require './lib/blog_app/entities/post'

RSpec.describe BlogApp::Entities::Post do
  describe '#initialize' do
    it 'accepts an attribute hash' do
      post = described_class.new(author: 'fake-author', title: 'fake-title', body: 'fake body text')
      expect(post.author).to eq('fake-author')
      expect(post.title).to eq('fake-title')
      expect(post.body).to eq('fake body text')
    end
  end

  describe '#to_h' do
    it 'returns a symbol-key hash with the attributes' do
      post = described_class.new
      post.author = 'fake-author'
      post.title = 'fake-title'
      post.body = 'fake body text'

      expect(post.to_h)
        .to eq(
          author: 'fake-author',
          title: 'fake-title',
          body: 'fake body text',
          created_at: nil,
          updated_at: nil
        )
    end
  end

  describe '#==' do
    it 'evaluates equality' do
      equality =
        described_class.new(author: 'a', title: 'b', body: 'c') ==
          described_class.new(author: 'a', title: 'b', body: 'c')

      expect(equality).to eq(true)
    end

    it 'evaluates inequality' do
      equality =
        described_class.new(author: 'a', title: 'b', body: 'c') ==
          described_class.new(author: 'd', title: 'e', body: 'f')

      expect(equality).to eq(false)
    end
  end
end
