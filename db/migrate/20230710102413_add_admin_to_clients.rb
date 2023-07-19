class AddAdminToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :admin, :boolean, default: false
  end
end
