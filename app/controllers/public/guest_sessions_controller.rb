class Public::GuestSessionsController < ApplicationController
  def create
    @user = User.find_or_create_by!(email: "quest@example.com") do |user|
    user.password = SecureRandom.urlsafe_base64
    user.name = "ゲストユーザー"
    end
    
  end
end
