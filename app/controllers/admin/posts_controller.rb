class Admin::PostsController < ApplicationController
  #before_action :authenticate_admin!
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @tag_list = params[:post][:name].split(',')
    if @post.save
      @post.save_tag(@tag_list)
      redirect_to admin_post_path(@post.id)
    else
     render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_tag = PostTag.find(params[:id])
    # @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @tag_list = params[:post][:tag_name].split(',')
    if @post.update(post_params)
      @post.save_tag(@tag_list)
      redirect_to admin_post_path(@post.id)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:image,:matsuri_name,:article, :season, :area)
  end

end
