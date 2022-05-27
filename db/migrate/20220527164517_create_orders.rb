class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :company, null: false, foreign_key: true
      t.string :recipient_name
      t.string :recipient_registration_number
      t.string :recipient_telephone
      t.string :recipient_email
      t.string :recipient_address
      t.string :recipient_postal_code
      t.string :recipient_city
      t.string :recipient_state
      t.string :product_code
      t.integer :product_length
      t.integer :product_height
      t.integer :product_width
      t.integer :product_weight
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :state

      t.timestamps
    end
  end
end
