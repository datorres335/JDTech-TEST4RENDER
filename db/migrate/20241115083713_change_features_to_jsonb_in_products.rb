class ChangeFeaturesToJsonbInProducts < ActiveRecord::Migration[7.2]
  def change
    change_column :products, :features, :jsonb, default: []
  end
end
