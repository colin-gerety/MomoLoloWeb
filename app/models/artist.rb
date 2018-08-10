class Artist < ActiveRecord::Base
  default_scope { includes(:art_pieces).order("art_pieces.currently_hanging DESC, art_pieces.needs_label DESC, art_pieces.id DESC").references(:art_pieces) }

  has_many :art_pieces, dependent: :destroy
end
