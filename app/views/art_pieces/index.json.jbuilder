json.array!(@art_pieces) do |art_piece|
  json.extract! art_piece, :id, :title, :media, :price, :needs_label, :currently_hanging, :momo_percent, :artist_percent, :other_percent, :note, :artist_id
  json.url art_piece_url(art_piece, format: :json)
end
