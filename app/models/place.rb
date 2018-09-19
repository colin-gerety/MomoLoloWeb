class Place < ApplicationRecord
  default_scope { includes(:place_photos).order("place_photos.updated_at DESC").references(:place_photos) }

  has_many :place_photos, dependent: :destroy, inverse_of: :place
  accepts_nested_attributes_for :place_photos, allow_destroy: true, reject_if: proc { |attributes| attributes[:name].blank? }
end
