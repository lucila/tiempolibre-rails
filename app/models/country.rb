class Country < ActiveRecord::Base
  validates :name, presence: true

  translates :name
end
