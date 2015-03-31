class PostsController < ApplicationController

  before_action :authenticate_author!

  def index
    @posts = Post.all
    render json: @posts
  end


  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages
    end
  end


  def post_params
    params.require(:post).permit(:title,:body).merge(author_id: current_author.id)
  end
end
