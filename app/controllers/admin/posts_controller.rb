class Admin::PostsController < ApplicationController
  def new
  end
  
  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end
end
