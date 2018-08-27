class Barista < ApplicationRecord
  default_scope { includes(:barista_photos).order("barista_photos.updated_at DESC").references(:barista_photos) }
  
  has_many :barista_photos, dependent: :destroy

  after_initialize do |barista|
    barista.currently_working ||= true
  end
end

