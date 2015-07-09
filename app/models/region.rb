class Region < ActiveRecord::Base
  belongs_to :country
  has_many :destinations

  validates :country, presence: true

  translates :name
  globalize_accessors locales: [:es, :en, :"pt-BR"], attributes: [:name]

end
