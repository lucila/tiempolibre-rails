class ExcursionsController < TiempolibreAppController
  def index
    @title = "Excursiones"
    @excursions = Excursion.all
    if params[:region_id].present?
      region_id = params[:region_id]
      @region = Region.find(region_id)
      destinations_ids = Destination.where(region_id: region_id).pluck(:id)
      @excursions = Excursion.where(destination_id: destinations_ids)
    end
  end

  def show
    @excursion = Excursion.find(params[:id])
    @other_excursions = @excursion.destination.excursions - [@excursion]
    @title = @excursion.name
  end
end
