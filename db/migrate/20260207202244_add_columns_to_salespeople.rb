class AddColumnsToSalespeople < ActiveRecord::Migration[8.1]
  def change
    add_column :salespeople, :first_name, :string
    add_column :salespeople, :last_name, :string
    add_column :salespeople, :email, :string
  end
end
