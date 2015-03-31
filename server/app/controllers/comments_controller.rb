class CommentsController < ApplicationController

  before_action :authenticate_author!

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages
    end
  end


  def comment_params
    params.require(:comment).permit(:body,:post_id).merge(author_id: current_author.id)
  end
end
