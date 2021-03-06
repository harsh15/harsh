class Video < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => [:slugged, :finders]

  enum status: [ :not_published, :published ]
  scope :recent, -> { order("id desc") }
  
  has_many :photos, :as => :origin, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true
  has_one :cover_photo, -> { where(photo_type: Photo::COVER) }, :as => :origin, :class_name => "Photo"
  SOURCE = ["facebook", "youtube"] 

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

end
