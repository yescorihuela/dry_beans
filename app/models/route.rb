class Route < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 30 }
  validates :name, uniqueness: true
end
