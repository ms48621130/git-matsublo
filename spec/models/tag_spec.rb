# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag do
  let(:tag) { create(:tag) }
  describe "モデルの各カラムが存在するか" do
    it "タグ名が存在すること" do
      expect(tag.tag_name).to be_present
    end
  end
  describe '実際に保存してみる' do
    it "有効な投稿内容の場合は保存されるか" do
	    expect(FactoryBot.build(:tag)).to be_valid
	  end
  end
end