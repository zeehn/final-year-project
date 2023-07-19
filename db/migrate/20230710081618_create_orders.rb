class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :schedule_date
      t.time :time_from 
      t.time :time_to
      t.text :instructions
      t.references :client, null: false, foreign_key: true
      t.references :maid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
