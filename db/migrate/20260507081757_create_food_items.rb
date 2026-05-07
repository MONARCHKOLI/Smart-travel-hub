class CreateFoodItems < ActiveRecord::Migration[8.1]
  def change
    create_table :food_items do |t|
      t.references :motel, null: false, foreign_key: true
      t.string :name
      t.decimal :price
      t.integer :prep_time_minutes

      t.timestamps
    end
  end
end
