class AddLocationToCustomers < ActiveRecord::Migration[5.1]
  def change
  	add_column :customers, :lat, :float
    add_column :customers, :lng, :float
    change_column :customers, :phone, :string
  end
end
