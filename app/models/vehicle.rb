class Vehicle < ApplicationRecord
  validates :license_plate, :v_model, :v_brand, :v_year, :max_load, presence: true
  validates :license_plate, uniqueness: true
  validates :license_plate, format: {with: /\A[A-Z]{3}\d{1}[A-Z0-9]{1}\d{2}\Z/}

  belongs_to :company
end