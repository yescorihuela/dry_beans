class Trip < ApplicationRecord
  belongs_to :route
  has_many :actions
end
