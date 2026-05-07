json.extract! food_item, :id, :motel_id, :name, :price, :prep_time_minutes, :created_at, :updated_at
json.url food_item_url(food_item, format: :json)
