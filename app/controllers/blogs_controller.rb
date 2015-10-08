class BlogsController < InheritedResources::Base

  def model
    @blog
  end
        
  def index
    @blogs = Blog.recent.page(params[:page]).per(10)
    recent_blogs
  end

  def show
    @blog = Blog.find(params[:id])
    recent_blogs
  end

  def recent_blogs
    @recent_blogs = Blog.recent.limit(4)
  end

end

