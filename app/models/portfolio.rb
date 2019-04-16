class Portfolio < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: "Angular")
  end

  after_initialize :set_defaults

  #if image is Nil, set default image
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: 350, width: 350)
    self.thumb_image ||= Placeholder.image_generator(height: 150, width: 150)
  end
end
