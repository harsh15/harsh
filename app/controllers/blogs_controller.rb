class BlogsController < InheritedResources::Base

  add_breadcrumb "Home", :root_path

  def model
    @blog
  end
        
  def index
    @blogs = Blog.recent.page(params[:page]).per(10)
    recent_blogs()
    add_breadcrumb "Blogs", blogs_path()
  end

  def show
    @blog = Blog.find(params[:id])
    recent_blogs()
    add_breadcrumb "Blogs", :blogs_path
    add_breadcrumb @blog.title, blog_path(@blog)
  end

end

