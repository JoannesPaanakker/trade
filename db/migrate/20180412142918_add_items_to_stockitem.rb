class AddItemsToStockitem < ActiveRecord::Migration[5.1]
  def change
    add_column :stockitems, :retail_price, :integer
    add_column :stockitems, :release_date, :date
    add_column :stockitems, :colour, :string
    add_column :stockitems, :photo, :string
  end
end
