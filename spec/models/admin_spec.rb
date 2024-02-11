# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin do
  let(:admin) { create(:admin) }
  describe "モデルの各カラムが存在するか" do
    it "メールアドレスが存在すること" do
      expect(admin.email).to be_present
    end
    it "パスワードが存在すること" do
      expect(admin.password).to be_present
    end
  end
  describe '実際に保存してみる' do
    it "有効な投稿内容の場合は保存されるか" do
	    expect(FactoryBot.build(:admin)).to be_valid
	  end
  end
  context "空白のバリデーションチェック" do
    it "メールアドレスが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      admin = Admin.new(email: '')
	    expect(admin).to be_invalid
      expect(admin.errors[:email]).to include("を入力してください")
    end
    it "パスワードが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      admin = Admin.new(password: '')
	    expect(admin).to be_invalid
      expect(admin.errors[:password]).to include("を入力してください")
    end
  end
end