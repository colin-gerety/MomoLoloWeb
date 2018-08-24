class PlacePhoto < ApplicationRecord
  belongs_to :place
  validates :place, presence: true

  mount_uploader :image, ImageUploader
end
