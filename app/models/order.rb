class Order < ApplicationRecord
  belongs_to :company
  enum status: {pending: 0, accepted: 5, refused: 10, delivered: 15}
  
  before_validation :generate_tracking_code, on: :create

  validates :recipient_name, :recipient_registration_number, :recipient_telephone, 
            :recipient_email, :recipient_address, :recipient_postal_code, :recipient_city, :recipient_state,
            :product_code, :product_length, :product_height, :product_width, :product_weight, :address, 
            :postal_code, :city, :state, :tracking_code, presence: true
  validates :recipient_registration_number, format: {with: /\A\d{3}\.?\d{3}\.?\d{3}\-?\d{2}\Z/}
  validates :recipient_telephone, format: {with: /\A\(?\d{2}\)?\d{4,5}\-?\d{4}\Z/}
  validates :recipient_email, format: {with: /\A[^@\s]+@[^@\s]+\z/}
  validates :postal_code, format: {with: /\A\d{2}\.?\d{3}\-?\d{3}\Z/}
  validates :recipient_postal_code, format: {with: /\A\d{2}\.?\d{3}\-?\d{3}\Z/}

  def delivery_address
    "#{recipient_address} - #{recipient_city} - #{recipient_state}"
  end

  def full_address
    "#{address} - #{city} - #{state}"
  end

  def dimensions
    "#{product_length} cm x #{product_width} cm x #{product_height} cm"
  end

  private

  def generate_tracking_code
    self.tracking_code = SecureRandom.alphanumeric(15).upcase
  end
end
