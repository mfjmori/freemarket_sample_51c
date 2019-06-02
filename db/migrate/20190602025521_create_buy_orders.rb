class CreateBuyOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_orders do |t|
      t.references :saler, null: false
      t.references :buyer, null: false
      t.references :item, null: false, foreign_key: true
      t.boolean :receive_completed, default: false, null: false
      
      t.timestamps
    end
  end
end
