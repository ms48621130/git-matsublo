class Public::PostsController < ApplicationController
  def show
    @review = Review.new
    @post = Post.find(params[:id])
    @tags = @post.tags
    @post_reviews = @post.reviews
  end
end
