class AddLatLongToMaids < ActiveRecord::Migration[7.0]
  def change
    add_column :maids, :latitude, :float
    add_column :maids, :longitude, :float
  end
end
