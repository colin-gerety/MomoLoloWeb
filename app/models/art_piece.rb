class ArtPiece < ActiveRecord::Base
  belongs_to :artist
  validates :artist, presence: true

  mount_uploader :image, ImageUploader
end
