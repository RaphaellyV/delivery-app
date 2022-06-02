class Deadline < ApplicationRecord
  belongs_to :company
  
  validates :min_distance, :max_distance, :max_days, presence: true
  validates :max_days, uniqueness: {scope: :company}
  validates :max_distance, comparison: { greater_than: :min_distance }

end
