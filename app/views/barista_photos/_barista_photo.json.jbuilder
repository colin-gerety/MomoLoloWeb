json.extract! barista_photo, :id, :image, :title, :note, :can_display, :created_at, :updated_at
json.url barista_photo_url(barista_photo, format: :json)
