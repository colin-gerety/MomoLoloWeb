class CreatePlacePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :place_photos do |t|
      t.string :image
      t.string :title
      t.string :note
      t.boolean :can_display, :default => true

      t.belongs_to :place, index: true, foreign_key: true

      t.timestamps
    end
  end
end
