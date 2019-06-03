class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :size, :string, null: true
  end

  def down
    change_column :items, :size, :string, null: false
  end
end
