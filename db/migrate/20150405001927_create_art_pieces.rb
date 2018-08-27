class CreateArtPieces < ActiveRecord::Migration[5.2]
  def change
    create_table :art_pieces do |t|
      t.string :title
      t.string :media
      t.float :price
      t.boolean :can_display, :default => true
      t.boolean :needs_label, :default => true
      t.boolean :currently_hanging, :default => true
      t.integer :momo_percent, :default => 30
      t.integer :artist_percent, :default => 70
      t.integer :other_percent, :default => 0
      t.text :note
      t.string :image
      t.belongs_to :artist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
