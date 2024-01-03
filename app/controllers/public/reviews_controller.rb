class Public::ReviewsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @reviews = @post.reviews
    # @post.id = @reviews.post_id
  end

  def show
    @user = User.find(params[:user_id])
    @reviews = @user.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @post = Post.find(params[:post_id])
    @tags = @post.tags
    @post_reviews = @post.reviews
    @reviews = @post.reviews
    if @review.save
      redirect_to post_reviews_path(@post.id)
    else
      render "public/posts/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:star, :title, :text, :post_id)
  end
end
