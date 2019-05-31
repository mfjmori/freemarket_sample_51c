class ChangeColumnReadability < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :delivery_fee, :delivery_cost
    rename_column :items, :delivery_days, :delivery_day
    rename_column :items, :ship_from, :prefecture
    rename_column :items, :ship_by, :ship_method
  end
end
