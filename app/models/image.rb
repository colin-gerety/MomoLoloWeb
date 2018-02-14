class Image < ApplicationRecord
  belongs_to :picturable, polymorphic: true
  mount_uploader :image, ImageUploader

  after_initialize do |image|
    image.display_in_ui ||= true
  end

end
