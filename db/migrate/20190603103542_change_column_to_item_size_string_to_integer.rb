class ChangeColumnToItemSizeStringToInteger < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :size, :integer, null: true
  end

  def down
    change_column :items, :size, :string, null: true
  end
end
