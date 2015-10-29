class VideosController < ApplicationController
  add_breadcrumb "Home", :root_path

  def model
    @video
  end
  
  def index
    @videos = Video.page(params[:page]).per(10)
    recent_blogs()
    add_breadcrumb "Videos", videos_path()
  end

  def show
    @video = Video.find(params[:id])
    recent_blogs()
    add_breadcrumb "Video", :videos_path
    add_breadcrumb @video.title, video_path(@video)
  end

end
