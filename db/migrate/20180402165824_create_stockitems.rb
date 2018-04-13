class CreateStockitems < ActiveRecord::Migration[5.1]
  def change
    create_table :stockitems do |t|
      t.boolean :dead_stock, default: true
      t.boolean :sold_status, default: false
      t.integer :internal_size
      t.integer :sell_price
      t.timestamps
    end
  end
end
