class Ranch < ActiveRecord::Base
  belongs_to :destination

  has_one :country, through: :destination
  has_one :region, through: :destination

  translates :name, :about
  globalize_accessors locales: [:es, :en, :"pt-BR"], attributes: [:name, :about]
end
