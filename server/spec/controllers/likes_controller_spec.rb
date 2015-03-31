require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let(:author) {FactoryGirl.create(:author)}

  context "Author Login" do

    login_author

    before do
      allow(controller).to receive(:current_author).and_return(author)
    end

    describe "POST create" do

      it "should create like for comment" do
        post :create,{like: {likeable_id: 4,likeable_type: 'Comment'}}
        expect(response).to be_success
      end

      it "should create like for post" do
        post :create,{like: {likeable_id: 4,likeable_type: 'Like'}}
        expect(response).to be_success
      end
    end
  end

  context "Professor login" do

    login_professor

    describe "POST create" do
      it "should be not authorized" do
        post :create,{like: {comment_id: 4}}
        expect(response.code).to eq("401")
      end
    end
  end
end
