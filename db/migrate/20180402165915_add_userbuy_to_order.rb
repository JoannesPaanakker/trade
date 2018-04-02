class AddUserbuyToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :userbuy, foreign_key: true
  end
end
