class AddRegionToShoesize < ActiveRecord::Migration[5.1]
  def change
    add_reference :shoesizes, :region, foreign_key: true
  end
end
