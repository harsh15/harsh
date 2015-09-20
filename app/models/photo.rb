class Photo < ActiveRecord::Base
  belongs_to :origin, :polymorphic => true
  mount_uploader :photo, PhotoUploader

  enum status: [ :new_uploaded, :croped, :verfied, :rejected ]

  COVER = "cover"
  NORMAL = "normal"
  PROFILE = "profile"
  TYPES = [COVER, NORMAL, PROFILE]

  def cover?
    photo_type == COVER
  end

end
