class Public::GuestSessionsController < ApplicationController
  def create
    @user = User.find_or_create_by!(email: "guest@example.com", name: "ゲストユーザー") do |user|
    user.password = SecureRandom.urlsafe_base64
    end
    redirect_to root_path
    flash[:notice] = "ログインユーザーとしてログインしました"
  end
end
