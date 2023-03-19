class Public::GuestSessionsController < ApplicationController
  def guest_login
    user = User.find_by(email: "guest@example.com", name: "ゲストユーザー")
    sign_in user
    redirect_to root_path
    flash[:notice] = "ログインユーザーとしてログインしました"
  end
end
