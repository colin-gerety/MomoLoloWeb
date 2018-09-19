class BaristaPhoto < ApplicationRecord
  belongs_to :barista, inverse_of: :barista_photos
  validates :barista, presence: true

  mount_uploader :image, ImageUploader
end
