class Public::HomesController < ApplicationController
  def top
    @posts = Post.all
  end

  def search
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

  def about
  end
end
