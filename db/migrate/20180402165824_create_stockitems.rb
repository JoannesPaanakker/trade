class CreateStockitems < ActiveRecord::Migration[5.1]
  def change
    create_table :stockitems do |t|
      t.string :stock_type
      t.string :description
      t.boolean :sold_status
      t.string :original_code
      t.integer :sell_price

      t.timestamps
    end
  end
end
