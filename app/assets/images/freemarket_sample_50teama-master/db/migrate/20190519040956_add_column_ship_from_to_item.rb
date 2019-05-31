class AddColumnShipFromToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :ship_from, :integer
  end
end
