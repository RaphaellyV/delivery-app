class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :license_plate
      t.string :v_brand
      t.string :v_model
      t.integer :v_year
      t.integer :max_load

      t.timestamps
    end
  end
end
