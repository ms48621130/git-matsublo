# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review do
  let(:review) { create(:review) }
  describe "モデルの各カラムが存在するか" do
    it "タイトルが存在すること" do
      review = build(:review)
	    expect(review.valid?).to eq(false)
      expect(review.title).to be_present
    end
    it "本文が存在すること" do
      review = build(:review)
	    expect(review.valid?).to eq(false)
      expect(review.text).to be_present
    end
    it "星評価が存在すること" do
      review = build(:review)
	    expect(review.valid?).to eq(false)
      expect(review.star).to be_present
    end
  end
  describe '実際に保存してみる' do
    it "有効なレビュー内容の場合は保存されるか" do
	    expect(FactoryBot.build(:review)).to be_valid
	  end
  end
  context "空白のバリデーションチェック" do
    it "タイトルが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      review = Review.new(title: '')
	    expect(review).to be_invalid
      expect(review.errors[:title]).to include("を入力してください")
    end
    it "本文が空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      review = Review.new(text: '')
	    expect(review).to be_invalid
      expect(review.errors[:text]).to include("を入力してください")
    end
    it "星評価が空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      review = Review.new(star: '')
	    expect(review).to be_invalid
      expect(review.errors[:star]).to include("を入力してください")
    end
  end
end