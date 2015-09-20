# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumb do
    cloudinary_transformation :width => 50, :height => 50, :crop => :fill, :gravity => :faces
  end

  def public_id
    basename = "#{File.basename(original_filename, File.extname(original_filename))}_#{Time.now.to_i}"
    "#{Rails.env}/photos/#{model.origin_type}/#{model.origin_id}/#{basename}"
  end
end
