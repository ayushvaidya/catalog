class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    @comment = @post.comments.create(params[:comment].permit(:body, :post_id))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      render 'new'
    end
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

end
