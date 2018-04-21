class AddItemsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :postalcode, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :phonenumber, :string
  end
end
