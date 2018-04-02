class AddUsersellToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :usersell, foreign_key: true
  end
end
