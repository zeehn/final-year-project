class AddAdminToMaids < ActiveRecord::Migration[7.0]
  def change
    add_column :maids, :admin, :boolean, default: false
  end
end
