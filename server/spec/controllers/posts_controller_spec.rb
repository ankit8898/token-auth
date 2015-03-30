require 'rails_helper'

RSpec.describe PostsController, type: :controller do


  context "Author Login" do
    login_author

    let!(:comment_one)   {FactoryGirl.create(:comment)}
    let!(:comment_two)   {FactoryGirl.create(:comment)}
    let!(:comment_three) {FactoryGirl.create(:comment)}
    let!(:like_one)      {FactoryGirl.create(:like)}
    let!(:like_two)      {FactoryGirl.create(:like)}
    let!(:like_three)    {FactoryGirl.create(:like)}
    let!(:post_one)      {FactoryGirl.create(:post,comments: [],likes: [])}
    let!(:post_two)      {FactoryGirl.create(:post,comments: [comment_three],likes: [like_three])}

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
                                    'comments_count' => 0,
                                    'likes' => [],
                                    'author' => {
                                      'id' => post_one.author.id,
                                      'email' => post_one.author.email,
                                      'name' => post_one.author.name,
                                    }
                                  },
                                  {
                                    'id' => post_two.id,
                                    'title' => post_two.title,
                                    'body' => post_two.body,
                                    'likes_count' => 1,
                                    'comments_count' => 1,
                                    'author' => {
                                      'id' => post_two.author.id,
                                      'email' => post_two.author.email,
                                      'name' => post_two.author.name,
                                    },
                                    'comments' => [
                                      {
                                        'id' => comment_three.id,
                                        'body' => comment_three.body,
                                        'post_id' => post_two.id,
                                        'author' => {
                                          'id' => comment_three.author.id,
                                          'email' => comment_three.author.email,
                                          'name' => comment_three.author.name

                                        }
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


    describe "GET show" do

      let(:post) {FactoryGirl.create(:post,title: "Foo",body: "Bar",comments: [],likes: [])}

      it "should give details for single post" do
        get :show,{id: post.id}
        expect(response).to be_success
      end

      it "json response" do
        get :show,{id: post.id}
        expect(json_body).to eq(
          {
            'id' => post.id,
            'title' => "Foo",
            'body' => "Bar",
            'likes' => [],
            'comments' => [],
            'comments_count' => 0,
            'author' => {
              'id' => post.author.id,
              'email' => post.author.email,
              'name' => post.author.name,
            },
            'likes_count' => 0
          }
        )
      end
    end

    describe "POST create" do

      it "should create post" do
        post :create,{post: {title: 'A',body: 'BBBBBBBBBBBBBBBBBB'}}
        expect(response).to be_success
      end

    end
  end

  context "Professor login" do

    login_professor

    describe "GET index" do
      it "should be not authorized" do
        get :index
        expect(response.code).to eq("401")
      end
    end

    describe "GET show" do
      it "should be not authorized" do
        get :show,{id: 2}
        expect(response.code).to eq("401")
      end
    end

    describe "POST create" do
      it "should be not authorized" do
        post :create,{post: {title: 'A',body: 'C'}}
        expect(response.code).to eq("401")
      end
    end
  end
end
