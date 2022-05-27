class Company < ApplicationRecord
  validates :brand_name, :corporate_name, :domain, :registration_number, :postal_code, 
            :billing_address, :city, :state, :domain, presence: true
  validates :registration_number, :domain, uniqueness: true
  validates :postal_code, format: {with: /\A\d{2}\.?\d{3}\-?\d{3}\Z/}
  validates :registration_number, format: {with: /\A\d{2}\.?\d{3}\.?\d{3}\/?\d{4}\-?\d{2}\Z/}
  validates :domain, format: {with: /\A@[^@\s]+\z/}
end