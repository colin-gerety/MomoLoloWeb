class BaristaPhoto < ApplicationRecord
  belongs_to :barista
  validates :barista, presence: true

  mount_uploader :image, ImageUploader
end
