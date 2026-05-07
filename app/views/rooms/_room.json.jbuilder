json.extract! room, :id, :motel_id, :room_type, :price, :status, :created_at, :updated_at
json.url room_url(room, format: :json)
