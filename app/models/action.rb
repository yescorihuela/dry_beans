class Action < ApplicationRecord
  OPERATION_OPTIONS = %w(pick_up delivery)

  belongs_to :trip
  validates :operation, presence: true
  validates :operation, inclusion: {in: OPERATION_OPTIONS }

  validates :address, presence: true
  validates :address, length: {minimum: 5, maximum: 100}
  validates :comments, length: {maximum: 255}
  validates :latitude, presence: true
  validates :longitude, presence: true
end