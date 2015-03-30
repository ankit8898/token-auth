require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  # before do
  login_student
  # let!(:student) do
  #   #FactoryGirl.create(:student)
  #   #Student.create!(email: 'a@a.com',)
  #   user = 'r'
  #   Student.create!(email: "#{user}@a.com",
  #                   password: 'P@ssw0rd',
  #                   uid: "#{user}@a.com",
  #                   provider: 'email',
  #                   confirmed_at: Time.now)
  # end


  describe "GET index" do
    # endlogin_student
    # before do
    #   @request.env["devise.mapping"] = Devise.mappings[:student]
    #   sign_in student
    # end

    xit "should be success" do
      get :index
      expect(response).to be_success
    end
  end
end
