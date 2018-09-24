class Artist < ActiveRecord::Base
  default_scope { includes(:art_pieces).order("art_pieces.currently_hanging DESC, art_pieces.needs_label DESC, art_pieces.id DESC").references(:art_pieces) }

  has_many :art_pieces, dependent: :destroy, inverse_of: :artist
  accepts_nested_attributes_for :art_pieces, allow_destroy: true, reject_if: proc {|attributes| attributes[:first].blank || attributes[:last].blank?}

end
