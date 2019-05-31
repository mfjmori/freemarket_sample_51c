class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :customer_id, null: false
      t.integer :card_id, null: false

      t.timestamps
    end
  end
end
