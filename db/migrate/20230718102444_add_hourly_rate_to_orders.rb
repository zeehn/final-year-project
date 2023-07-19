class AddHourlyRateToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :hourly, :integer
  end
end
