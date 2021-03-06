class Price < ApplicationRecord
  belongs_to :company
  
  validates :min_vol, :max_vol, :min_weight, :max_weight, :price_per_km, presence: true
  validates :price_per_km, uniqueness: {scope: :company}
  validates :max_vol, comparison: { greater_than: :min_vol }
  validates :max_weight, comparison: { greater_than: :min_weight }

end
