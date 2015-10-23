class AddCityIdAndStateIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :country_id, :integer
    add_column :users, :state_id, :integer
    add_column :users, :city_id, :integer
    remove_column :users, :location, :string
  end
end
