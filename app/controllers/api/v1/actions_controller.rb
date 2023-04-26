class Api::V1::ActionsController < Api::V1::ApplicationController
  before_action :set_trip, only: %i[create]

  def create
    @action = @trip.actions.build(set_params)
    if @action.save
      render json: { ok: true, action: @action }, status: :created
    else
      render json: { ok: false, errors: @action.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:action).permit(:operation, :address, :comments, :latitude, :longitude)
  end

  def set_trip
    @trip = Trip.find_by(id: params[:trip_id])
  end
end
