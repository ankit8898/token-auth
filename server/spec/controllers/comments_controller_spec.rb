require 'rails_helper'

RSpec.describe CommentsController, type: :controller do


  context "Author Login" do
    login_author

    let(:author) {FactoryGirl.create(:author)}

    describe "POST create" do

      before do
        allow(controller).to receive(:current_author).and_return(author)
      end

      it "should create comment" do
        post :create,{comment: {body: 'This is a comment..yo!',post_id: 2}}
        expect(response).to be_success
      end

    end
  end

  context "Professor login" do

    login_professor


    describe "POST create" do
      it "should be not authorized" do
        post :create,{post: {title: 'A',body: 'C'}}
        expect(response.code).to eq("401")
      end
    end
  end
end
