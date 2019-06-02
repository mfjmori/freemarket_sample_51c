class AddNicknameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :point, :integer, null: false, default: 0
    add_column :users, :sum_sales, :integer, null: false, default: 0
  end
end
