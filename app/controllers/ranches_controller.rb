class RanchesController < TiempolibreAppController
  def index
    @title = "Excursiones"
    @ranches = Ranch.all
    if params[:region_id].present?
      region_id = params[:region_id]
      @region = Region.find(region_id)
      destinations_ids = Destination.where(region_id: region_id).pluck(:id)
      @ranches = Ranch.where(destination_id: destinations_ids)
    end
  end

  def show
    @ranch = Ranch.find(params[:id])
    @other_ranches = @ranch.destination.ranches - [@ranch]
    @title = @ranch.name
  end
end
