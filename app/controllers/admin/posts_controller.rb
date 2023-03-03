class Admin::PostsController < ApplicationController
  def new
    @post = Post.new
    @prefecture = @post.prefectures.build
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
    @prefectures = @post.prefectures
  end

  def edit
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:image, :matsuri_name, :article, :season,
    prefectures_attributes: [:area])
  end

end
