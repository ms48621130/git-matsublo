# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }
  describe "モデルの各カラムが存在するか" do
    it "ユーザー名が存在すること" do
      expect(user.name).to be_present
    end
    it "メールアドレスが存在すること" do
      expect(user.email).to be_present
    end
    it "パスワードが存在すること" do
      expect(user.password).to be_present
    end
  end
  describe '実際に保存してみる' do
    it "有効な投稿内容の場合は保存されるか" do
	    expect(FactoryBot.build(:user)).to be_valid
	  end
  end
  context "空白のバリデーションチェック" do
    it "ユーザー名が空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(name: '')
	    expect(user).to be_invalid
      expect(user.errors[:name]).to include("を入力してください")
    end
    it "メールアドレスが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(email: '')
	    expect(user).to be_invalid
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "パスワードが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(password: '')
	    expect(user).to be_invalid
      expect(user.errors[:password]).to include("を入力してください")
    end
    #it "ユーザーアイコンが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      #user = build(:user, image: nil)
	    #expect(user.valid?).to eq(false)
      #expect(user.errors[:image]).to include("を入力してください")
    #end
  end
end