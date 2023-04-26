class Api::V1::TripsController < Api::V1::ApplicationController
  before_action :set_trip, only: %i[show complete]
  before_action :set_route, only: %i[show complete]

  def create
    @trip = @route.trips.build(set_params)
    if @trip.save!
      render json: { ok: true, trip: @trip }, status: :created
    else
      render json: { ok: false, errors: @trip.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def complete
    if @trip.update(completed: true)
      render json: { ok: true, trip: @trip }, status: :ok
    else
      render json: { ok: false, errors: @trip.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def set_route
    @route = Route.find_by(id: params[:route_id])
  end

  def set_trip
    @trip = Trip.find_by(id: params[:id])
  end

  def set_params
    params.require(:trip).permit(:completed)
  end
end
