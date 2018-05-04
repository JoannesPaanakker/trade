class AddPriceToOrders < ActiveRecord::Migration[5.1]
  def change
    add_monetize :orders, :order_price, currency: { present: false }
  end
end
