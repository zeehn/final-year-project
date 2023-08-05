class RenameAddressInClients < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :clients, :address, :street
  end

  def self.down
    rename_column :clients, :street, :address
  end
end
