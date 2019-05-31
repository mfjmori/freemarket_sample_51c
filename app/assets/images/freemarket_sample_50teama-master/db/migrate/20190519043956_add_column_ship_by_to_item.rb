class AddColumnShipByToItem < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :ship_from, false
    add_column :items, :ship_by, :integer, null: false

  end
end
