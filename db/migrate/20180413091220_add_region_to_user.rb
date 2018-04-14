class AddRegionToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :region, foreign_key: true, default: 2
  end
end
