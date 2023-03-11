class Public::HomesController < ApplicationController
  def top
    @posts = Post.all
    
  end

  def post_search
    @posts = Post.all
    if (params[:season]!= "" )
      @posts = @posts.season_search(params[:season])
    end

    if (params[:area]!= "" )
      @posts = @posts.area_search(params[:area])
    end

    if (params[:keyword]!= "" )
      @posts = @posts.keyword_search(params[:keyword])
    end

    # @keyword = params[:keyword]
    render "top"
  end

  def tag_search
    @tags = Tag.all
    if(params[:tag_name]!= "")
      #byebug
      @tags = Tag.where(tag_name: params[:tag_name])
#      @tags = Tag.tag_name_search(params[:tag_name])
    end

    #@posts = Post.all
    posttag= PostTag.where(tag_id:@tags)
    @posts = Post.where(id:posttag)
    #byebug
    render "top"
  end


  def about
  end
end
