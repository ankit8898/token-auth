class PostsController < ApplicationController

  before_action :authenticate_author!

  def index
    @posts = Post.all
    render json: @posts
  end


  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages
    end
  end
end
