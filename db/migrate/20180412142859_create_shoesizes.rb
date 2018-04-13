class CreateShoesizes < ActiveRecord::Migration[5.1]
  def change
    create_table :shoesizes do |t|
      t.string :sizes
      t.timestamps
    end
  end
end
