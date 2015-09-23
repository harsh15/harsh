class BlogsController < InheritedResources::Base

  def model
    @blog
  end
        
  def index
    @blogs = Blog.page(params[:page]).per(10)
    recent_blogs
    # prepare_meta_tags
    set_meta_tags title: 'Member Login'
  end

  def show
    @blog = Blog.find(params[:id])
    recent_blogs
    prepare_meta_tags
  end

  def recent_blogs
    @recent_blogs = Blog.all
  end

  def prepare_meta_tags
    set_meta_tags :title => "title harsh 1",
                  :description => "description 1",
                  :og => {
                    :title => "harsh title",
                  }
  end

end

