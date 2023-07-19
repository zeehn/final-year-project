class AddAdminToAdmin < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :admin, :boolean, default: true
  end
end
