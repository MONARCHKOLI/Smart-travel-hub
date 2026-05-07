json.extract! food_order, :id, :booking_id, :food_item_id, :quantity, :status, :scheduled_ready_time, :created_at, :updated_at
json.url food_order_url(food_order, format: :json)
