class CoursesController < ApplicationController

  before_action :authenticate_professor!

  def index

    @courses = Course.all
    render json: @courses
  end
end
