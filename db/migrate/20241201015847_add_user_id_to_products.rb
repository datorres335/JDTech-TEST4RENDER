class AddUserIdToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :user_id, :integer
    add_index :products, :user_id # adds an index for faster lookups
  end
end
