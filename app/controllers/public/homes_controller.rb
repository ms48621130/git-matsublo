class Public::HomesController < ApplicationController
  def top
    @posts = Post.all
    @tags = Tag.joins(:posts).where.not(posts: { id: nil })
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

    end
    @tags = Tag.joins(:posts).where.not(posts: { id: nil })
    render "top"
  end

  def tag_search
    if(params[:tag_name].present?)
      @posts = Post.includes(:tags).where(tags:{tag_name: params[:tag_name]})
#      @tags = Tag.tag_name_search(params[:tag_name])
    else
      @posts = Post.all
    end
    #@posts = Post.all
    # posttag= PostTag.where(tag_id:@tags)
    # @posts = Post.where(id:posttag)
    @tags = Tag.joins(:posts).where.not(posts: { id: nil })
    render "top"
  end


  def about
  end
end
