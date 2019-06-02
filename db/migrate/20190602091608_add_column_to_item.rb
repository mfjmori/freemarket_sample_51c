class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :condition, :integer, null: false
  end
end
