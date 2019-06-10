class AddStatusToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :status, :boolean, null: false, default: false
  end
end
