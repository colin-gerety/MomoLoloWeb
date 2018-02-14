json.extract! artist, :id, :name, :phone, :web_site, :email, :created_at, :updated_at
json.url artist_url(artist, format: :json)
