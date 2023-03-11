class Public::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @tag = Tag.find(params[:id])
  end



end
