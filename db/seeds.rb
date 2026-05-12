# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require "open-uri"

Motel.destroy_all

motels = [
  {
    name: "Blue Horizon Resort",
    address: "Goa",
    description: "Luxury beach resort",
    lat: 15.2993,
    lon: 74.1240,
    image_url: "https://images.unsplash.com/photo-1566073771259-6a8506099945"
  },
  {
    name: "The Pine Lodge",
    address: "Manali",
    description: "Mountain view stay",
    lat: 32.2432,
    lon: 77.1892,
    image_url: "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267"
  },
  {
    name: "Urban Oasis Motel",
    address: "Mumbai",
    description: "Modern city motel",
    lat: 19.0760,
    lon: 72.8777,
    image_url: "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa"
  }
]

motels.each do |data|

  motel = Motel.create!(
    name: data[:name],
    address: data[:address],
    description: data[:description],
    lat: data[:lat],
    lon: data[:lon]
  )

  file = URI.open(data[:image_url])

  motel.image.attach(
    io: file,
    filename: "#{motel.name.parameterize}.jpg"
  )

  motel.rooms.create!([
    { room_type: "Deluxe King", price: 150.0, status: "available" },
    { room_type: "Executive Suite", price: 250.0, status: "available" },
    { room_type: "Standard Twin", price: 90.0, status: "available" }
  ])

  motel.food_items.create!([
    { name: "Breakfast Club Sandwich", price: 12.0, prep_time_minutes: 10 },
    { name: "Classic Beef Burger", price: 18.0, prep_time_minutes: 15 },
    { name: "Fresh Garden Salad", price: 10.0, prep_time_minutes: 8 }
  ])

  puts "✅ Created #{motel.name}"

end


