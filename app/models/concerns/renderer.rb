require "active_support/concern"

module Renderer
  def self.as_json(obj, keys = [])
    hash = {}
    hash = obj.as_json
    hash["trips"] = []
    if obj.respond_to?(:trips)
      obj.trips.each do |trip|
        if trip.respond_to?(:actions)
          _trip = trip.as_json
          _trip["actions"] = []
          trip.actions.each do |action|
            _trip["actions"] << action.as_json
          end
          hash["trips"] << _trip
        end
      end
    end
    hash
  end
end