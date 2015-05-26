TiempolibreRails::Application.routes.draw do

  resources :destinations, only: [:show, :index]

  root to: 'destinations#index'
  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale

end
