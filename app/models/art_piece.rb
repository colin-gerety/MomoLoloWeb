class ArtPiece < ApplicationRecord
  belongs_to :artist
  has_one :image, as: :picturable, dependent: :destroy, inverse_of: :art_piece

  accepts_nested_attributes_for :image, reject_if: proc { |attributes| attributes[:image].blank? }, allow_destroy: true

  after_initialize do |art_piece|
    art_piece.needs_label ||= false
    art_piece.momo_percent ||= 10
    art_piece.artist_percent ||= 90
    art_piece.other_percent ||= 0
    art_piece.currently_hanging ||= true
  end
end

