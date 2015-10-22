class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_render :prepare_meta_tags, :except => [:destroy, :update]
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :phone, :gender, :date_of_birth, :location, :interested_in, :prefered_language, :subdomain, :password, :password_confirmation)}
  end

  def prepare_meta_tags
    setting_name = "#{params[:controller].gsub("/", ".")}.#{action_name}"
    val = setting_value("title", setting_name)
    set_meta_tags :title => setting_value("title", setting_name),
                  :description => setting_value("meta.description", setting_name),
                  :keywords => setting_value("meta.keywords", setting_name),
                  :og => {
                    :title => setting_value("og.title", setting_name, "title"),
                    :description => setting_value("og.description", setting_name, "meta.description"),
                    :image => setting_value("og.image", setting_name),
                    :url => setting_value("og.url", setting_name),
                    :type => setting_value("og.type", setting_name)
                  },
                  :twitter => {
                    :card => setting_value("twitter.card", setting_name),
                    :title => setting_value("twitter.title", setting_name, "title"),
                    :description => setting_value("twitter.description", setting_name, "meta.description"),
                    "image:src" => setting_value("twitter.image", setting_name, "og.image")
                  }
  end

  def setting_value(base_setting, setting_name, alt_base_setting = nil)
    setting = "#{base_setting}.#{setting_name}"
    alt_setting = "#{alt_base_setting}.#{setting_name}" if alt_base_setting.present?
    while(setting != base_setting)
      val = Setting[setting]
      val = Setting[alt_setting] if val.nil? && alt_setting.present?
      break if val.present?
      setting = remove_last(setting)
      alt_setting = remove_last(alt_setting) if alt_setting.present?
    end
    val = Setting[base_setting] if val.nil?
    val = Setting[alt_base_setting] if val.nil? && alt_base_setting.present?

    eval(%Q{"#{val}"})
  end

  def remove_last(str)
    *arr, last = str.split(".")
    arr.join(".")
  end
  
  def recent_blogs
    @recent_blogs = Blog.recent.limit(4)
  end

end
