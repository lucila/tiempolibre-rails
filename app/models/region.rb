class Region < ActiveRecord::Base
  belongs_to :country
  has_many :destinations

  validates :country, presence: true
end
