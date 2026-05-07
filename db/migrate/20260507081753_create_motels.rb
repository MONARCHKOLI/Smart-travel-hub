class CreateMotels < ActiveRecord::Migration[8.1]
  def change
    create_table :motels do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lon
      t.text :description

      t.timestamps
    end
  end
end
