class Destination < ActiveRecord::Base
  belongs_to :region

  validates :region, presence: true

  after_initialize :initialize_fields

  translates :name, :about
  globalize_accessors locales: [:es, :en, :"pt-BR"], attributes: [:name, :about]

  def initialize_fields
    self.fall_max ||= 0
    self.fall_min ||= 0
    self.winter_max ||= 0
    self.winter_min ||= 0
    self.spring_max ||= 0
    self.spring_min ||= 0
    self.summer_max ||= 0
    self.summer_min ||= 0
  end

  def has_temp?
    temps = fall_max.abs + fall_min.abs + winter_max.abs + winter_min.abs + spring_max.abs +
      spring_min.abs + summer_max.abs + summer_min.abs
    temps > 0
  end
end
