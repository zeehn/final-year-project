class AddLatLongToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :latitude, :float
    add_column :clients, :longitude, :float
  end
end
