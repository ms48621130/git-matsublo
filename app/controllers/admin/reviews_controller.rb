class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @reviews = Review.all
    @user = User.find(params[:user_id])
  end

  def show
  end

  def destroy
    @user = User.find(params[:user_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_user_reviews_path(@user.id)
  end
end
