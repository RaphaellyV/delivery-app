class Deadline < ApplicationRecord
  validates :min_distance, :max_distance, :max_days, presence: true
  validates :max_days, uniqueness: true
  #validates (:min_distance..:max_distance), uniqueness: true
  validates :max_distance, comparison: { greater_than: :min_distance }
  #validates :max_days, uniqueness: { scope: :year,
   # message: "should happen once per year" }
end
