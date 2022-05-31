class Deadline < ApplicationRecord
  validates :min_distance, :max_distance, :max_days, presence: true
  validates :max_days, uniqueness: {scope: :company}
  validates :max_distance, comparison: { greater_than: :min_distance }

  belongs_to :company
end
