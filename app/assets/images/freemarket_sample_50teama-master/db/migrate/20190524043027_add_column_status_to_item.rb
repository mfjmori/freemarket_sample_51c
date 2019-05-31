class AddColumnStatusToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :status, :integer, null: false, default: 1
  end
end
