class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
    @regions = Region.all
  end

  def show
    @regions = Region.all
    @destination = Destination.find(params[:id])
    @destinations = Destination.all
  end
end
