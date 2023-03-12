class Public::HomesController < ApplicationController
  def top
    @posts = Post.all
    @tags = Tag.all
  end

  def post_search
    @posts = Post.all
    if (params[:season]!= "" )
      @posts = Post.where(season: params[:season])
    end

    if (params[:area]!= "" )
      @posts = Post.where(area: params[:area])
    end

    if (params[:matsuri_name]!= "" )
      @posts = Post.where(matsuri_name: params[:matsuri_name])
      # where(["matsuri_name like?", "%#{keyword}%"]) → matsuri_nameに対して部分一致をしたい

    end
    @tags = Tag.all
    # @keyword = params[:keyword]
    render "top"
  end

  def tag_search
    @tags = Tag.all
    if(params[:tag_name]!= "")
      @tags = Tag.where(tag_name: params[:tag_name])
#      @tags = Tag.tag_name_search(params[:tag_name])
    end
    @posts = Post.all
    #@posts = Post.all
    # posttag= PostTag.where(tag_id:@tags)
    # @posts = Post.where(id:posttag)
    render "top"
  end


  def about
  end
end
