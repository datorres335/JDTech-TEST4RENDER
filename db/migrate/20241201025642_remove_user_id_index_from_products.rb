class RemoveUserIdIndexFromProducts < ActiveRecord::Migration[7.2]
  def change
    remove_index :products, column: :user_id, name: "index_products_on_user_id"
  end
end
