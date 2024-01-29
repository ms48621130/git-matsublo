class Admin::PostTagsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_tags = @post.post_tags
    @tag_list = params[:post_tag][:tag_name].split(',')
    @post.save_tag(@tag_list)
    redirect_to admin_post_path(@post.id)
  end

  def destroy
#    @post = Post.find(params[:post_id])
#    @tag_list = params[:post][:name].split(',')
#    @post.destroy(@tag_list)

    post_tag = PostTag.find_by(tag_id: params[:tag_id], post_id: params[:post_id])
    post_tag.destroy
    @post = Post.find(params[:post_id])
  end

end
