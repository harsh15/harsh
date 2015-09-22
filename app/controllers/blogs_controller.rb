class BlogsController < InheritedResources::Base

  def model
    @blog
  end
        
  def index
    @blogs = Blog.page(params[:page]).per(10)
    recent_blogs
    prepare_meta_tags
  end

  def show
    @blog = Blog.find(params[:id])
    recent_blogs
    prepare_meta_tags
  end

  def recent_blogs
    @recent_blogs = Blog.all
  end

end

