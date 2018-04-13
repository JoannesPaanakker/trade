class CreateCatalogitems < ActiveRecord::Migration[5.1]
  def change
    create_table :catalogitems do |t|
      t.integer :retail_price
      t.date :release_date
      t.string :colour
      t.string :photo
      t.string :brand
      t.string :description
      t.string :product_code
      t.string :category, default: "shoe"

      t.timestamps
    end
  end
end
