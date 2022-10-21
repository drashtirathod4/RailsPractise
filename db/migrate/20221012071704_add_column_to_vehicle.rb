class AddColumnToVehicle < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :level, :string
  end
end
