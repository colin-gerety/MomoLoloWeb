json.extract! art_piece, :id, :artist_id, :title, :media, :price, :needs_label, :currently_hanging, :momo_percent, :artist_percent, :other_percent, :note, :created_at, :updated_at
json.url art_piece_url(art_piece, format: :json)
