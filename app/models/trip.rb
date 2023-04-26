class Trip < ApplicationRecord
  belongs_to :route
  has_many :actions

  validates :completed, inclusion: [true], on: :update

end
