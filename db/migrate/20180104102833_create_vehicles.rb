class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.integer :year
      t.date :make
      t.string :model
      t.string :trim
      t.string :style
      t.integer :vin
      t.integer :customer_id
      t.timestamps
    end
  end
end
