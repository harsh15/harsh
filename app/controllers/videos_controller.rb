class VideosController < ApplicationController
  add_breadcrumb "Home", :root_path

  def model
    @video
  end
  
  def index
    @videos = Video.recent.page(params[:page]).per(10)
    recent_videos()
    add_breadcrumb "Videos", videos_path()
  end

  def show
    @video = Video.find(params[:id])
    recent_videos()
    add_breadcrumb "Video", :videos_path
    add_breadcrumb @video.title, video_path(@video)
  end

end
