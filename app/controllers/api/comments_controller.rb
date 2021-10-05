class Api::CommentsController < Api::ApiController
    def index
      @post = Post.find(params[:post_id])      
      @comments = @post.comments
      render json: @comments
    end

    def create
        # @user = User.find(params[:user_id])
        @post = Post.find(params[:post_id])
        comment = @post.comment.new(comment_params)

        if comment.save
            render json: comment
        else
            render json: {status: 'error', message:'comment created'}
        end

        Private

        def comment_params
            params.require(:comment).permit(:content)
        end

    end
  end