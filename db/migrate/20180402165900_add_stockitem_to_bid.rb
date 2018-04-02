class AddStockitemToBid < ActiveRecord::Migration[5.1]
  def change
    add_reference :bids, :stockitem, foreign_key: true
  end
end
