class PostsSerializer
  def initialize(post)
    @post = post
  end

  def as_json
    @post.to_h
  end
end
