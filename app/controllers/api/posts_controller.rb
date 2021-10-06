class Api::PostsController < Api::ApiController
  def index
    @post = Post.all
    render json: @post
  end
end
