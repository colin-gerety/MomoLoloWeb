class Place < ApplicationRecord
  default_scope { includes(:place_photos).order("place_photos.updated_at DESC").references(:place_photos) }

  has_many :place_photos, dependent: :destroy
end
