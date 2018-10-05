class EventImage < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :events
end

