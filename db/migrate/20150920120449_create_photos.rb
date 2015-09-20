class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string  :photo
      t.string  :caption
      t.string  :description,     :limit => 2000
      t.integer :origin_id
      t.string  :origin_type
      t.string  :photo_type, default: Photo::NORMAL
      t.string  :original_photo
      t.integer :status

      t.timestamps null: false
    end
  end
end
 