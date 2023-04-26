class Route < ApplicationRecord
  has_many :trips
  has_many :actions, through: :trips

  before_validation :set_name_uppercase, on: :create

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 30 }
  validates :name, uniqueness: true

  private

  def set_name_uppercase
    self.name.upcase!
  end
end
