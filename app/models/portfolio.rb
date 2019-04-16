class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                              reject_if: lambda { |attrs| attrs['name'].blank? }

  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: "Angular")
  end

  #Once a portfolio is initized with New, call set_defaults
  after_initialize :set_defaults

  #if image is Nil, set default image
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: 350, width: 350)
    self.thumb_image ||= Placeholder.image_generator(height: 150, width: 150)
  end
end
