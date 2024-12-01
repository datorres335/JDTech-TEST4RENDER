class DropUserIdIndexFromProducts < ActiveRecord::Migration[7.2]
  def change
    remove_index :products, name: "index_products_on_user_id"
  end
end
