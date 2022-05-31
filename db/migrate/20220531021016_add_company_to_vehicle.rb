class AddCompanyToVehicle < ActiveRecord::Migration[7.0]
  def change
    add_reference :vehicles, :company, null: true, foreign_key: true
  end
end
