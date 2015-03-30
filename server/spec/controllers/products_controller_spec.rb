require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  login_author

  it "should be success" do
    get :index
    ap response.body
  end

end
