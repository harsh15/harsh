class HomeController < ApplicationController
  def index
    @blogs = Blog.recent.page(params[:page]).per(10)
    recent_blogs()
  end	
end
