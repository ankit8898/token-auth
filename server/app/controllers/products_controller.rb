class ProductsController < ApplicationController

  before_action :authenticate_author!

  def index
    @products = Product.all
    render json: @products
  end
end
