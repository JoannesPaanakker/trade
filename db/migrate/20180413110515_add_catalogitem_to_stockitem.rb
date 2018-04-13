class AddCatalogitemToStockitem < ActiveRecord::Migration[5.1]
  def change
    add_reference :stockitems, :catalogitem, foreign_key: true
  end
end
