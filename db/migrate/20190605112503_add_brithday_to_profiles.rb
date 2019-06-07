class AddBrithdayToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :brithday, :date
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :payjp_id, :string
  end
end
