class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string  :title,               null: false
      t.string  :short_description,   null: false, limit: 1000
      t.text    :description,    null: false
      t.date    :publish_date,        null: false
      t.integer :status,              null: false
      t.string  :video_url

      t.timestamps null: false
    end
  end
end
