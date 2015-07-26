class Excursion < ActiveRecord::Base
  belongs_to :destination

  has_one :country, through: :destination
  has_one :region, through: :destination
  has_many :pictures, as: :imageable

  translates :name, :description
  globalize_accessors locales: [:es, :en, :"pt-BR"], attributes: [:name, :description]

  accepts_nested_attributes_for :pictures, reject_if: :all_blank , allow_destroy: true
end
