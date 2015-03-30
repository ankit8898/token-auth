class PostsController < ApplicationController

  before_action :authenticate_author!

  def index

    #User.find_by(email: current_author.email).posts
    @posts = Post.all  #should be current_user.posts
    render json: @posts
  end
end
