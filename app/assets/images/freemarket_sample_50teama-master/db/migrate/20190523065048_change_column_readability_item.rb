class ChangeColumnReadabilityItem < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :prefecture, :delivery_prefecture
    rename_column :items, :ship_method, :delivery_method
  end
end
