class Cruise < ActiveRecord::Base
  belongs_to :region

  has_one :country, through: :region

  translates :name, :about
  globalize_accessors locales: [:es, :en, :"pt-BR"], attributes: [:name, :about]
end
