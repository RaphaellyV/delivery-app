class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :brand_name
      t.string :corporate_name
      t.string :domain
      t.string :registration_number
      t.string :postal_code
      t.string :billing_address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
