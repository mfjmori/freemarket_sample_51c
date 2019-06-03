class RenameCategoriesIdToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :categories_id, :category_id
  end
end
