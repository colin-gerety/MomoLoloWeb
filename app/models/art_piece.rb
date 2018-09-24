class ArtPiece < ActiveRecord::Base
  belongs_to :artist, inverse_of: :art_pieces
  validates :artist, presence: true

  mount_uploader :image, ImageUploader
end
