ActiveAdmin.register Video do

  permit_params :title, :description, :publish_date, :status, :url, :data_href, :source, photos_attributes: ["id", "caption", "description", "photo_type", "status", "photo", "_destroy"]

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "blogs" do
      f.input :title
      f.input :description, as: :html_editor
      f.input :publish_date, as: :date_picker
      f.input :source, as: :select, collection: Video::SOURCE
      f.input :status, as: :select, collection: Video::statuses.keys
      f.input :url
      f.input :data_href
      f.has_many :photos  do |p|
        p.input :caption
        p.input :description
        p.input :photo_type, as: :select, :collection => Photo::TYPES
        p.input :photo, :as => :file, :label => "Image", :hint => p.template.image_tag(p.object.photo.url(:thumb))
        if(p.object.present?)
          p.input :id, :as=>:hidden
          p.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove image'
        end
      end      
    end
    f.actions
  end

end
