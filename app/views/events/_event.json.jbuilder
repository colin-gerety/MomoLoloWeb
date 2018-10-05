json.extract! event, :id, :start, :end, :title, :description, :event_image_id, :created_at, :updated_at
json.url event_url(event, format: :json)
