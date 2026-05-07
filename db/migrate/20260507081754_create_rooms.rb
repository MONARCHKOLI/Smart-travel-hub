class CreateRooms < ActiveRecord::Migration[8.1]
  def change
    create_table :rooms do |t|
      t.references :motel, null: false, foreign_key: true
      t.string :room_type
      t.decimal :price
      t.string :status

      t.timestamps
    end
  end
end
