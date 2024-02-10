# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }
  let(:test) { "1" }
  describe "user name" do
    it "user nameが存在すること" do
      expect(user.name).to be_present
    end
  end
  it "1であること" do
    expect("1".to_i).to eq(1)
  end
end