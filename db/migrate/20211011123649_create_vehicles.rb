class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :model
      t.string :license_plate
      t.string :color
      t.string :type

      t.timestamps
    end
  end
end
