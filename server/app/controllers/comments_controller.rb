class CommentsController < ApplicationController

  before_action :authenticate_author!

  def create
    ap comment_params
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages
    end
  end


  def comment_params
    ap params
    params.require(:comment).permit(:body,:post_id)
  end
end
