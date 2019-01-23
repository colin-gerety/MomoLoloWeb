json.extract! contact, :id, :name, :contact_type, :phone, :email, :address, :supplier_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
