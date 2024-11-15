class AddFeaturesToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :features, :text
  end
end
