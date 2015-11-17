class DestinationsController < TiempolibreAppController
  def index
    @title = "Destinos"
    @destinations = Destination.all
    if params[:region_id].present?
      region_id = params[:region_id]
      @destinations = Destination.where(region_id: region_id)
      @region = Region.find(region_id)
    end
  end

  def show
    @destination = Destination.find(params[:id])
    @title = @destination.name
  end
end
