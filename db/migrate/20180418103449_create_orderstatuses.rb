class CreateOrderstatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :orderstatuses do |t|
      t.integer :code
      t.string :description

      t.timestamps
    end
  end
end
