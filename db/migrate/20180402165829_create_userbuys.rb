class CreateUserbuys < ActiveRecord::Migration[5.1]
  def change
    create_table :userbuys do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
