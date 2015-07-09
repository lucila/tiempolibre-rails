class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :initialize_menu

  def set_locale
    if cookies[:tourist_locale] && I18n.available_locales.include?(cookies[:tourist_locale].to_sym)
      l = cookies[:tourist_locale].to_sym
    else
      l = I18n.default_locale
      cookies.permanent[:tourist_locale] = l
    end
    I18n.locale = l
  end

  def initialize_menu
    @regions = Region.all.includes(:destinations)
  end
end
