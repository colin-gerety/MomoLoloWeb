class AddPrimaryPhotoToBaristaPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :barista_photos, :primary_photo, :boolean
  end
end
