class Admin::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
     redirect_to admin_post_path(@post.id)
    else
     render :new
    end
  end

  def show
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:image, :matsuri_name, :article, :prefecture_id, :season)
  end

end
