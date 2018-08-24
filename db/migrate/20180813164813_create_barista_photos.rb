class CreateBaristaPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :barista_photos do |t|
      t.string :image
      t.string :title
      t.string :note
      t.boolean :can_display, :default => true

      t.belongs_to :barista, index: true, foreign_key: true

      t.timestamps
    end
  end
end
