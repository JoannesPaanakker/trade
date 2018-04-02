class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.date :order_time
      t.integer :order_price

      t.timestamps
    end
  end
end
