TiempolibreRails::Application.routes.draw do

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :destinations, only: [:show, :index]
  resources :excursions, only: [:show, :index]

  root to: 'destinations#index'
  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale

end
