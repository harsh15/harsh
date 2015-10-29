class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :data_href
      t.string :source
      t.date :publish_date
      t.integer :status

      t.timestamps null: false
    end
  end
end
