class TiempolibreAppController < ApplicationController
  before_action :initialize_web_menu

  def initialize_web_menu
    @regions = Region.all.includes(:destinations)
    @cruises = Cruise.all
    @ranches = Ranch.all
  end
end



