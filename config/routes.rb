TiempolibreRails::Application.routes.draw do

  resources :destinations, only: [:show, :index]

  # root to: 'application#index'

end
