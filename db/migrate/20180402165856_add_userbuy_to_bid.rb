class AddUserbuyToBid < ActiveRecord::Migration[5.1]
  def change
    add_reference :bids, :userbuy, foreign_key: true
  end
end
