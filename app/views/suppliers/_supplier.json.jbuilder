json.extract! supplier, :id, :name, :order_info, :delivery_type, :payment_type, :notes, :maintains_stock, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
