class Barista < ApplicationRecord
#  default_scope { includes(:barista_photos).references(:barista_photos) }
  
  has_many :barista_photos, dependent: :destroy, inverse_of: :barista

  accepts_nested_attributes_for :barista_photos, allow_destroy: true, reject_if: proc {|attributes| attributes['image'].blank?}

  def full_name
    "#{first} #{last}"
  end
  
  def primary_photo
     barista_photos.where(primary_photo: true).order(created_at: :desc).limit(1).first
  end

end

