class RenameDescriptonColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :descripton, :description
  end
end
