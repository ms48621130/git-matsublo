# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
  describe "indexアクション" do
    it "正常なレスポンスか？" do
      get :index
      expect(response).to be_successful
    end
    it "200レスポンスが返ってきてるか？" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
  describe "showアクション" do
  let(:post) { create(:post) }
  subject {response}
    it "正常なレスポンスか？" do
      get :show, params: {id: post.id}
      is_expected.to be_successful
    end
    it "200レスポンスが返ってきてるか？" do
      get :show, params: {id: post.id}
      is_expected.to have_http_status(200)
    end
  end
  describe "newアクション" do
  subject {response}
    it "正常なレスポンスか？" do
      get :new
      is_expected.to be_successful
    end
    it "200レスポンスが返ってきてるか？" do
      get :new
      is_expected.to have_http_status(200)
    end
  end
  describe "editアクション" do
  let(:post) { create(:post) }
  subject {response}
    it "正常なレスポンスか？" do
      get :edit, params: {id: post.id}
      is_expected.to be_successful
    end
    it "200レスポンスが返ってきてるか？" do
      get :edit, params: {id: post.id}
      is_expected.to have_http_status(200)
    end
  end
  describe "createアクション" do
    it "正常に記事を作成できるか？" do
      expect {
        post :create, params: {
          post: {
            matsuri_name: "example",
            season: 1,
            area: "example",
            article: "example",
            name: "example",
            image: fixture_file_upload(File.open('app/assets/images/no_image.jpg'),'image/jpg')
          }
        }
      }.to change{Post.count}.by(1)
    end
  end
  describe "updateアクション" do
    let(:edit_post) { create(:post,matsuri_name: "example") }
    it "正常に記事を編集できるか？" do
      expect(edit_post.matsuri_name).to eq "example"
        put :update, id: edit_post, params: {
          post: {
            #id: edit_post.id,
            matsuri_name: "example2",
            season: 2,
            area: "example2",
            article: "example2",
            name: "example2",
            image: fixture_file_upload(File.open('app/assets/images/no_image.jpg'),'image/jpg')
          }
        }
        edit_post.reload
        expect(edit_post.matsuri_name).to eq "example2"

    end
  end
end