class Cruise < ActiveRecord::Base
  belongs_to :region

  has_one :country, through: :region
  has_many :pictures, as: :imageable

  translates :name, :about
  globalize_accessors locales: [:es, :en, :"pt-BR"], attributes: [:name, :about]

  accepts_nested_attributes_for :pictures, reject_if: :all_blank , allow_destroy: true
end
