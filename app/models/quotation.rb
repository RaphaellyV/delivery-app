class Quotation < ApplicationRecord
  validates :height, :length, :width, :weight, :distance, presence: true

  has_many :companies

  def dimensions
    "#{length} cm x #{width} cm x #{height} cm"
  end
end
