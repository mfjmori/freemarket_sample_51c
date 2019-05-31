class ChangeRelation < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :item_id
    add_column :likes, :item_id, :integer
    remove_column :likes, :user_id
  end
end
