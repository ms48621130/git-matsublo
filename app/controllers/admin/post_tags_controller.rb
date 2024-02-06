class Admin::PostTagsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_tags = @post.post_tags
    @tag_list = params[:post_tag][:tag_name].split(',')
    @post.save_tag(@tag_list)
    redirect_to admin_post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_tag = @post.post_tags.find(params[:id])
    @post_tag.destroy
    redirect_to admin_post_path(@post.id)
  end

end
