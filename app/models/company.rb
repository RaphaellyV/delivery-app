class Company < ApplicationRecord
  has_many :users
  has_many :deadlines
  has_many :prices
  has_many :vehicles

  validates :brand_name, :corporate_name, :domain, :registration_number, :postal_code, 
            :billing_address, :city, :state, :domain, presence: true
  validates :registration_number, :domain, uniqueness: true
  validates :postal_code, format: {with: /\A\d{2}\.?\d{3}\-?\d{3}\Z/}
  validates :registration_number, format: {with: /\A\d{2}\.?\d{3}\.?\d{3}\/?\d{4}\-?\d{2}\Z/}
  validates :domain, format: {with: /\A@[^@\s]+\z/}

  def full_description
    "#{brand_name} | #{corporate_name} | #{state}"
  end

end