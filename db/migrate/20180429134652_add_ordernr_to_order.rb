class AddOrdernrToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :order_nr, :integer
  end
end
