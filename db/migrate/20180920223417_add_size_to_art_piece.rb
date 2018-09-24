class AddSizeToArtPiece < ActiveRecord::Migration[5.2]
  def change
    add_column :art_pieces, :size, :string
  end
end
