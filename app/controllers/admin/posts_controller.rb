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
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_post_path(@post.id)
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :matsuri_name, :article, :season, :area)
  end

end
