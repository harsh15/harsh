class Blog < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => [:slugged, :finders]

  belongs_to :admin_user
  belongs_to :blog_category  
  has_many :photos, :as => :origin, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true
  has_one :cover_photo, -> { where(photo_type: Photo::COVER) }, :as => :origin, :class_name => "Photo"
  enum status: [ :not_published, :published ]

end
