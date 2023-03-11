class Admin::PostsController < ApplicationController
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
    # @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      @tag_list = params[:post][:name].split(',')
      @post.save_tag(@tag_list)
      redirect_to admin_post_path(@post.id)
    else
      render :edit
    end
  end

  def update_tag
    @post = Post.find(params[:id])
    @tag_list = params[:post][:name].split(',')
    @post.save_tag(@tag_list)
    byebug
  end

  def delete_tag
#    @post = Post.find(params[:post_id])
#    @tag_list = params[:post][:name].split(',')
#    @post.destroy(@tag_list)

    tag = PostTag.find_by(tag_id: params[:tag_id], post_id: params[:post_id])
    tag.destroy
    @post = Post.find(params[:post_id])
  end

  private

  def post_params
    params.require(:post).permit(:image,:matsuri_name,:article, :season, :area)
  end

end
