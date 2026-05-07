class CreateFoodOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :food_orders do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :food_item, null: false, foreign_key: true
      t.integer :quantity
      t.string :status
      t.datetime :scheduled_ready_time

      t.timestamps
    end
  end
end
