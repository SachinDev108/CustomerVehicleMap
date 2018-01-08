class ChangeVinTypeInVehicles < ActiveRecord::Migration[5.1]
  def change
  	change_column :vehicles, :vin, :string
  end
end
