# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post do
  let(:post) { create(:post,area: 4) }
  describe "matsuri name" do
    it "お祭り名が存在すること" do
      expect(post.matsuri_name).to be_present
    end
    it "開催地域が宮城県であること" do
      expect(post.area).to eq(4)
    end
  end
end