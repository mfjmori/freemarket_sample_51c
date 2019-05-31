class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, limit: 40
      t.integer :condition, null: false
      t.integer :delivery_fee, null: false
      t.integer :delivery_days, null: false
      t.integer :price, null: false
      t.integer :buyer_id
      t.timestamps
    end
  end
end
