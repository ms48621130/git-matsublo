class Public::UsersController < ApplicationController
  before_action :authenticate_user!, :reject_guest_user, :reject_other_user

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      sign_in(@user)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def reject_other_user
    redirect_to root_path if current_user.id != params[:id].to_i
  end

  def reject_guest_user
    redirect_to root_path if current_user.email == "guest@example.com"
  end

  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :image)
  end
end
