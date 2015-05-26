class Country < ActiveRecord::Base
  validates :name, presence: true

  translates :name
  globalize_accessors locales: [:es, :en, :"pt-BR"], attributes: [:name]
end
