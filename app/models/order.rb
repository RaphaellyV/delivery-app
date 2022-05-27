class Order < ApplicationRecord
  belongs_to :company

  validates :recipient_name, :recipient_registration_number, :recipient_telephone, 
            :recipient_email, :recipient_address, :recipient_postal_code, :recipient_city, :recipient_state,
            :product_code, :product_length, :product_height, :product_width, :product_weight, :address, 
            :postal_code, :city, :state, presence: true

  def delivery_address
    "#{recipient_address} - #{recipient_city} - #{recipient_state}"
  end

  def full_address
    "#{address} - #{city} - #{state}"
  end

  def dimensions
    "#{product_length} cm x #{product_width} cm x #{product_height} cm"
  end
end
