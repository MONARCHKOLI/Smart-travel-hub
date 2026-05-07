class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.datetime :check_in
      t.datetime :check_out
      t.string :status
      t.decimal :deposit_amount

      t.timestamps
    end
  end
end
