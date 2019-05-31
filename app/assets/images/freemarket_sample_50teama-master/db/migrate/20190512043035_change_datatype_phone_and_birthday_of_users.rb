class ChangeDatatypePhoneAndBirthdayOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone, :string
    change_column :users, :birthday, :date
  end
end
