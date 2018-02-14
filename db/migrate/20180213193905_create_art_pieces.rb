class CreateArtPieces < ActiveRecord::Migration[5.1]
  def change
    create_table :art_pieces do |t|
      t.belongs_to :artist, foreign_key: true
      t.string :title
      t.string :media
      t.float :price
      t.boolean :needs_label
      t.boolean :currently_hanging
      t.integer :momo_percent
      t.integer :artist_percent
      t.integer :other_percent
      t.text :note

      t.timestamps
    end
  end
end
