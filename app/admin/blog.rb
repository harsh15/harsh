ActiveAdmin.register Blog do

  permit_params :title, :short_description, :description, :publish_date, :status, :video_url, :blog_category_id, photos_attributes: ["id", "caption", "description", "photo_type", "status", "photo", "_destroy"]

  index do
    column :id
    column :title
    column :short_description
    column :publish_date
    column :blog_category
    column :status
    column :video_url
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "blogs" do
      f.input :title
      f.input :short_description
      f.input :description, as: :html_editor
      f.input :publish_date, as: :date_picker
      f.input :blog_category
      f.input :status, as: :select, collection: Blog::statuses.keys
      f.input :video_url
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

  show do
    attributes_table do
      row :id
      row :title
      row :short_description
      row :description do |blog|
        blog.description.html_safe
      end
      row :publish_date
      row :blog_category
      row :status
      row :video_url
      row :photos
      panel "Photos" do
        table_for blog.photos do
          column "name" do |photo|
            photo.photo.url
            "<img src='#{photo.photo_url(:thumb)}'>".html_safe
          end
          column :photo
          column :caption
          column :description
          column :photo_type
          column :status
        end
      end
    end

  end

end
