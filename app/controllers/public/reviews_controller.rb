class Public::ReviewsController < ApplicationController
  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review.params)
    @post = Post.find(params[:id])
    if @review.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:star, :title, :text)
  end
end
