class Barista < ApplicationRecord
  default_scope { includes(:barista_photos).order("barista_photos.updated_at DESC").references(:barista_photos) }
  
  has_many :barista_photos, dependent: :destroy, inverse_of: :barista
  accepts_nested_attributes_for :barista_photos, allow_destroy: true, reject_if: proc {|attributes| attributes[:first].blank || attributes[:last].blank?}

  def full_name
    "#{first} #{last}"
  end
  
  def primary_photo
     barista_photos.where(primary_photo: true).order(created_at: :desc).limit(1).first
  end


  after_initialize do |barista|
    barista.currently_working ||= true
  end
end

