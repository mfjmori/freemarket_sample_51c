class RenameBrithdayColumnToProfiles < ActiveRecord::Migration[5.2]
  def change
    rename_column :profiles, :brithday, :birthday
  end
end
