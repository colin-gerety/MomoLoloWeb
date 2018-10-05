json.extract! event_image, :id, :title, :description, :image, :created_at, :updated_at
json.url event_image_url(event_image, format: :json)
