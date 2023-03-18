class Admin::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @user = User.find(params[:user_id])
  end

  def show
  end

  def edit
  end
end
