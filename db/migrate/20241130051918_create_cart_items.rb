class CreateCartItems < ActiveRecord::Migration[7.2]
  def change
    create_table :cart_items do |t|
      t.integer :user_id
      t.string :product_id

      t.timestamps
    end
  end
end
