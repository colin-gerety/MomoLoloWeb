json.extract! place_photo, :id, :image, :title, :note, :can_display, :created_at, :updated_at
json.url place_photo_url(place_photo, format: :json)
