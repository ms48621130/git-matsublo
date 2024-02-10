# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post do
  let(:post) { create(:post,area: 4 ,season: 12) }
  describe "モデルの各カラムが存在するか" do
    it "お祭り名が存在すること" do
      expect(post.matsuri_name).to be_present
    end
    it "開催地域が宮城県であること" do
      expect(post.area).to eq(4)
    end
    it "開催月が12月であること" do
      expect(post.season).to eq(12)
    end
    it "記事が存在すること" do
      expect(post.article).to be_present
    end
  end
  #describe '実際に保存してみる' do
    #it "有効な投稿内容の場合は保存されるか" do
	    #expect(FactoryBot.build(:post)).to be_valid
	  #end
  #end
  context "空白のバリデーションチェック" do
    it "お祭り名が空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      post = Post.new(matsuri_name: '')
	    expect(post).to be_invalid
      expect(post.errors[:matsuri_name]).to include("を入力してください")
    end
    it "記事が空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      post = Post.new(article: '')
	    expect(post).to be_invalid
      expect(post.errors[:article]).to include("を入力してください")
    end
    it "開催地域が空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      post = Post.new(season: '')
	    expect(post).to be_invalid
      expect(post.errors[:season]).to include("を入力してください")
    end
    it "開催月が空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      post = Post.new(area: '')
	    expect(post).to be_invalid
      expect(post.errors[:area]).to include("を入力してください")
    end
    #it "お祭り画像が空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      #post = build(:post, image: nil)
	    #expect(post.valid?).to eq(false)
      #expect(post.errors[:image]).to include("を入力してください")
    #end
  end
end