class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.references :country, index: true
      t.references :state, index: true

      t.timestamps null: false
    end
    add_foreign_key :cities, :countries
    add_foreign_key :cities, :states
  end
end
