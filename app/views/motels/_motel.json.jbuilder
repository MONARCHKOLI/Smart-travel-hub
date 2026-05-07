json.extract! motel, :id, :name, :address, :lat, :lon, :description, :created_at, :updated_at
json.url motel_url(motel, format: :json)
