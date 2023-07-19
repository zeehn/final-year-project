class AddAboutToMaids < ActiveRecord::Migration[7.0]
  def change
    add_column :maids, :about, :text
  end
end
