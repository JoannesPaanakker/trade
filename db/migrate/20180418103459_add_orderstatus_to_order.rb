class AddOrderstatusToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :orderstatus, foreign_key: true
  end
end
