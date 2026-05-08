class AddAmountToMotels < ActiveRecord::Migration[8.1]
  def change
    add_column :motels, :amount, :decimal, precision: 10, scale: 2
  end
end
