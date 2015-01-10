class VehiclesController < ApplicationController

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.save
    redirect_to vehicles_path, notice: 'Vehicle added successfully'

  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:color, :year, :mileage, :manufacturer_id, :description)
  end
end
