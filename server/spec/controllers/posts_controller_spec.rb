require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  login_author

  let!(:comment_one)   {FactoryGirl.create(:comment)}
  let!(:comment_two)   {FactoryGirl.create(:comment)}
  let!(:comment_three) {FactoryGirl.create(:comment)}
  let!(:like_one)  {FactoryGirl.create(:like)}
  let!(:like_two)  {FactoryGirl.create(:like)}
  let!(:like_three) {FactoryGirl.create(:like)}
  let!(:post_one) {FactoryGirl.create(:post,comments: [],likes: [])}
  let!(:post_two) {FactoryGirl.create(:post,comments: [comment_three],likes: [like_three])}

  describe "GET index" do
    it "should be success" do
      get :index
      expect(response).to be_success
    end


    it "should return the json collection of posts" do
      get :index
      expect(json_body).to eq([
                                {
                                  'id' => post_one.id,
                                  'title' => post_one.title,
                                  'body' => post_one.body,
                                  'likes_count' => 0,
                                  'comments' => [],
                                  'likes' => []
                                },
                                {
                                  'id' => post_two.id,
                                  'title' => post_two.title,
                                  'body' => post_two.body,
                                  'likes_count' => 1,
                                  'comments' => [
                                    {
                                      'id' => comment_three.id,
                                      'body' => comment_three.body
                                    }
                                  ],
                                  'likes' => [
                                    {
                                      'id' => like_three.id,
                                      'author' => {
                                        'id' => like_three.author.id,
                                        'email' => like_three.author.email,
                                        'name' => like_three.author.name

                                      }
                                    }
                                  ]
                                }
      ])

    end

  end
end
