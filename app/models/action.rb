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

  validates :latitude, numericality: { greater_than_or_equal_to: -90.0, less_than_or_equal_to: 90.0 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180.0, less_than_or_equal_to: 180.0 }
end