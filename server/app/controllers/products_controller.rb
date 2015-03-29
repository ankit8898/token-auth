class ProductsController < ApplicationController

  before_action :authenticate_student!

  def index
    @products = Product.all
    render json: @products
  end
end
