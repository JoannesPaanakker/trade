class AddUsersellToStockitem < ActiveRecord::Migration[5.1]
  def change
    add_reference :stockitems, :usersell, foreign_key: true
  end
end
