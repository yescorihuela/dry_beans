class Api::V1::RoutesController < Api::V1::ApplicationController
  before_action :set_route, only: %i[show]
  include Renderer

  def create
    @route = Route.new(route_params)
    if @route.save
      render json: {ok: true, route: @route}, status: :created
    else
      render json: {ok: false, errors: @route.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    if @route
      renderer_route = Renderer.as_json(@route)
      render json: {ok: true, route: renderer_route }, status: :ok
    else
      head :not_found
    end
  end

  private

  def set_route
    @route = Route.includes(trips: [:actions]).find_by(id: params[:id])
  end

  def route_params
    params.require(:route).permit(:name, :active)
  end
end
