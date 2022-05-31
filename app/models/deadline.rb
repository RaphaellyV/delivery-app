class Deadline < ApplicationRecord
  validates :min_distance, :max_distance, :max_days, presence: true
  validates :max_days, uniqueness: true
  validates :max_distance, comparison: { greater_than: :min_distance }

  belongs_to :company
end
