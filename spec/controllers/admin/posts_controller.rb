# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
  let(:post) { create(:post) }
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
    it "正常なレスポンスか？" do
      get :show, params: {id: post.id}
      expect(response).to be_successful
    end
    it "200レスポンスが返ってきてるか？" do
      get :show, params: {id: post.id}
      expect(response).to have_http_status(200)
    end
  end
  
end