class Public::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    # @post.id = @reviews.post_id
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to post_path(@review.post.id)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:star, :title, :text, :post_id)
  end
end
