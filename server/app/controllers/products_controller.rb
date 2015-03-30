class ProductsController < ApplicationController

  before_action :authenticate_professor!

  def index
    @products = Product.all
    render json: @products
  end
end
