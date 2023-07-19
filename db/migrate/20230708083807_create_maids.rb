class CreateMaids < ActiveRecord::Migration[7.0]
  def change
    create_table :maids do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.integer :hourly_rate

      t.timestamps
    end
  end
end
