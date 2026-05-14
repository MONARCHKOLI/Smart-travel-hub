# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb

# db/seeds.rb

require "open-uri"

puts "🧹 Cleaning database..."

Booking.destroy_all
FoodOrder.destroy_all
FoodItem.destroy_all
Room.destroy_all
Motel.destroy_all

ActiveStorage::Attachment.destroy_all
ActiveStorage::Blob.destroy_all

puts "🍽 Creating Smart Dine-In Restaurants..."

restaurants = [

  {
    name: "Blue Horizon Dining",
    address: "Goa",
    description: "Luxury beachfront dining experience with sunset seating, gourmet meals, and smart reservations.",
    lat: 15.2993,
    lon: 74.1240,
    amount: 2500,
    image_url: "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa",

    rooms: [

      {
        room_type: "Ocean View Couple Table",
        price: 1500.0,
        status: "available",
        image_url: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4"
      },

      {
        room_type: "VIP Family Lounge",
        price: 3500.0,
        status: "available",
        image_url: "https://images.unsplash.com/photo-1552566626-52f8b828add9"
      },

      {
        room_type: "Private Candlelight Booth",
        price: 5000.0,
        status: "available",
        image_url: "https://images.unsplash.com/photo-1414235077428-338989a2e8c0"
      }

    ],

    food_items: [

      {
        name: "Truffle Pasta",
        price: 18.0,
        prep_time_minutes: 15,
        image_url: "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9"
      },

      {
        name: "Classic Cheese Burger",
        price: 16.0,
        prep_time_minutes: 12,
        image_url: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd"
      },

      {
        name: "Tropical Fruit Salad",
        price: 10.0,
        prep_time_minutes: 8,
        image_url: "https://images.unsplash.com/photo-1546793665-c74683f339c1"
      }

    ]
  },

  {
    name: "Mountain Flame Bistro",
    address: "Manali",
    description: "Cozy mountain-view dining with fireplaces, handcrafted meals, and luxury seating.",
    lat: 32.2432,
    lon: 77.1892,
    amount: 1800,
    image_url: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4",

    rooms: [

      {
        room_type: "Snow View Dining Deck",
        price: 2200.0,
        status: "available",
        image_url: "https://images.unsplash.com/photo-1559339352-11d035aa65de"
      },

      {
        room_type: "Wooden Family Booth",
        price: 2800.0,
        status: "available",
        image_url: "https://images.unsplash.com/photo-1552566626-52f8b828add9"
      },

      {
        room_type: "Rooftop Romantic Table",
        price: 4500.0,
        status: "available",
        image_url: "https://images.unsplash.com/photo-1414235077428-338989a2e8c0"
      }

    ],

    food_items: [

      {
        name: "Hot Chocolate",
        price: 8.0,
        prep_time_minutes: 5,
        image_url: "https://images.unsplash.com/photo-1511920170033-f8396924c348"
      },

      {
        name: "Wood Fired Pizza",
        price: 14.0,
        prep_time_minutes: 20,
        image_url: "https://images.unsplash.com/photo-1513104890138-7c749659a591"
      },

      {
        name: "Creamy Alfredo Pasta",
        price: 17.0,
        prep_time_minutes: 18,
        image_url: "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9"
      }

    ]
  },

  {
    name: "Urban Spice Lounge",
    address: "Mumbai",
    description: "Modern luxury dine-in lounge with rooftop seating, live music, and smart table reservations.",
    lat: 19.0760,
    lon: 72.8777,
    amount: 2200,
    image_url: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4",

    rooms: [

      {
        room_type: "Skyline Window Table",
        price: 2000.0,
        status: "available",
        image_url: "https://images.unsplash.com/photo-1552566626-52f8b828add9"
      },

      {
        room_type: "Business Dining Suite",
        price: 4200.0,
        status: "available",
        image_url: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4"
      },

      {
        room_type: "Private VIP Lounge",
        price: 6500.0,
        status: "available",
        image_url: "https://images.unsplash.com/photo-1414235077428-338989a2e8c0"
      }

    ],

    food_items: [

      {
        name: "Paneer Tikka Wrap",
        price: 11.0,
        prep_time_minutes: 10,
        image_url: "https://images.unsplash.com/photo-1539252554453-80ab65ce3586"
      },

      {
        name: "Loaded French Fries",
        price: 7.0,
        prep_time_minutes: 7,
        image_url: "https://images.unsplash.com/photo-1573080496219-bb080dd4f877"
      },

      {
        name: "Cold Coffee",
        price: 6.0,
        prep_time_minutes: 4,
        image_url: "https://images.unsplash.com/photo-1517701604599-bb29b565090c"
      }

    ]
  }

]

restaurants.each do |data|

  puts "🍽 Creating #{data[:name]}"

  restaurant = Motel.create!(
    name: data[:name],
    address: data[:address],
    description: data[:description],
    lat: data[:lat],
    lon: data[:lon],
    amount: data[:amount]
  )

  # Restaurant Cover Image
  restaurant.image.attach(
    io: URI.open(data[:image_url]),
    filename: "#{restaurant.name.parameterize}.jpg"
  )

  puts "   📸 Restaurant image attached"

  # Seating Areas / Dining Tables
  data[:rooms].each do |room_data|

    room = restaurant.rooms.create!(
      room_type: room_data[:room_type],
      price: room_data[:price],
      status: room_data[:status]
    )

    if room_data[:image_url].present?

      room.image.attach(
        io: URI.open(room_data[:image_url]),
        filename: "#{room.room_type.parameterize}.jpg"
      )

    end

    puts "   🪑 Seating created: #{room.room_type}"

  end

  # Food Items
  data[:food_items].each do |food|

    food_item = restaurant.food_items.create!(
      name: food[:name],
      price: food[:price],
      prep_time_minutes: food[:prep_time_minutes]
    )

    if food[:image_url].present?

      food_item.image.attach(
        io: URI.open(food[:image_url]),
        filename: "#{food[:name].parameterize}.jpg"
      )

    end

    puts "   🍔 Food item added: #{food[:name]}"

  end

  puts "✅ Created #{data[:name]}"
  puts "-----------------------------------------"

end

puts ""
puts "🎉 Smart Dine-In Reservation Database Seeded!"
puts "🍽 Restaurants: #{Motel.count}"
puts "🪑 Seating Areas: #{Room.count}"
puts "🍔 Food Items: #{FoodItem.count}"
