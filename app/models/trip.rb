class Trip < ApplicationRecord
  belongs_to :route
  has_many :actions

  scope :incompleted_trips, -> { where(completed: false) }
  scope :completed_trips, -> { where(completed: true) }

  validates :completed, inclusion: [true], on: :update

end
