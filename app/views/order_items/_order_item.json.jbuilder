json.extract! order_item, :id, :name, :category, :item_id, :description, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
