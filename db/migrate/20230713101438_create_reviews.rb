class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :maid, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.integer :stars
      t.text :comment

      t.timestamps
    end
  end
end
