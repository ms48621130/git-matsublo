# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post do
  let(:post) { create(:post,area: 4 ,season: 12) }
  describe "matsuri name" do
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
end