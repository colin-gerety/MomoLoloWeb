class PlacePhoto < ApplicationRecord
  belongs_to :place, inverse_of: :place_photos
  validates :place, presence: true

  mount_uploader :image, ImageUploader
end
