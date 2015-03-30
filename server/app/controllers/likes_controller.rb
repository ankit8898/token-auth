class LikesController < ApplicationController

  before_action :authenticate_author!

  def create
    @like = Like.new(like_params)
    if @like.save
      render json: @like
    else
      render json: @like.errors.full_messages
    end
  end


  def like_params
    params.require(:like).permit(:likeable_id,:likeable_type)
  end
end
