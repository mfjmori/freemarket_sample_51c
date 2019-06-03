class ChangeColumnToItemRegionStringToInteger < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :region, :integer, null: false
  end

  def down
    change_column :items, :region, :string, null: false
  end
end
