class BlogsController < InheritedResources::Base
    
  def index
    @blogs = Blog.page(params[:page]).per(10)
    recent_blogs
  end

  def show
    @blog = Blog.find(params[:id])
    recent_blogs
  end

  def recent_blogs
    @recent_blogs = Blog.all
  end

end

