class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :descripton, null: false
      t.references :buyer
      t.references :saler
      t.string :brand
      t.references :categories, null: false, foreign_key: true
      t.string :size, null: false
      t.integer :price, null: false
      t.integer :postage, null: false
      t.integer :shipping_method, null: false
      t.string :region, null: false
      t.integer :shipping_date, null: false
      t.timestamps
    end
  end
end
