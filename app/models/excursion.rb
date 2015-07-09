class Excursion < ActiveRecord::Base
  belongs_to :destination

  has_one :country, through: :destination
  has_one :region, through: :destination

  translates :name, :description
  globalize_accessors locales: [:es, :en, :"pt-BR"], attributes: [:name, :description]
end
