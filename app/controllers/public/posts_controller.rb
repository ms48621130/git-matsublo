class Public::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @tags = @post.tags
  end



end
