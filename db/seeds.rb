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

# db/seeds.rb

require "faker"
require "open-uri"

puts "🧹 Cleaning database..."

FoodOrder.destroy_all
Booking.destroy_all
FoodItem.destroy_all
Room.destroy_all
Motel.destroy_all
User.destroy_all

ActiveStorage::Attachment.destroy_all
ActiveStorage::Blob.destroy_all

RESTAURANT_IMAGES = [
  "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4",
  "https://images.unsplash.com/photo-1552566626-52f8b828add9",
  "https://images.unsplash.com/photo-1559339352-11d035aa65de",
  "https://images.unsplash.com/photo-1514933651103-005eec06c04b",
  "https://images.unsplash.com/photo-1555396273-367ea4eb4db5"
]

ROOM_IMAGES = [
  "https://images.unsplash.com/photo-1414235077428-338989a2e8c0",
  "https://images.unsplash.com/photo-1528605248644-14dd04022da1",
  "https://images.unsplash.com/photo-1515669097368-22e68427d265",
  "https://images.unsplash.com/photo-1551632436-cbf8dd35adfa",
  "https://images.unsplash.com/photo-1559339352-11d035aa65de"
]

FOOD_IMAGES = [
  "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
  "https://images.unsplash.com/photo-1513104890138-7c749659a591",
  "https://images.unsplash.com/photo-1550547660-d9450f859349",
  "https://images.unsplash.com/photo-1546069901-ba9599a7e63c",
  "https://images.unsplash.com/photo-1528735602780-2552fd46c7af",
  "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9"
]

ROOM_TYPES = [
  "Family Dining",
  "VIP Lounge",
  "Private Dining",
  "Rooftop Seating",
  "Garden Dining",
  "Couple Table"
]

BOOKING_STATUSES = [
  "pending",
  "confirmed"
]

FOOD_STATUSES = [
  "scheduled",
  "preparing",
  "ready"
]

puts "👤 Creating users..."

20.times do |i|

  User.create!(
    email: "user#{i}@demo.com",
    password: "password123",
    confirmed_at: Time.current
  )

end

users = User.all

puts "🏨 Creating restaurants..."

100.times do |i|

  motel = Motel.create!(

    name: Faker::Restaurant.name,

    address: Faker::Address.full_address,

    description:
      Faker::Restaurant.description,

    lat:
      Faker::Address.latitude,

    lon:
      Faker::Address.longitude,

    amount:
      rand(1000..10000)

  )

  begin

    motel.image.attach(
      io: URI.open(
        RESTAURANT_IMAGES.sample
      ),
      filename: "restaurant.jpg"
    )

  rescue => e

    puts "Restaurant image failed"

  end


  rand(4..8).times do

    room = motel.rooms.create!(

      room_type:
        ROOM_TYPES.sample,

      price:
        rand(500..6000),

      status:
        "available"

    )

    begin

      room.image.attach(
        io: URI.open(
          ROOM_IMAGES.sample
        ),
        filename: "room.jpg"
      )

    rescue => e

      puts "Room image failed"

    end

  end


  rand(15..25).times do

    food = motel.food_items.create!(

      name:
        Faker::Food.dish,

      price:
        rand(100..900),

      prep_time_minutes:
        rand(5..30)

    )

    begin

      food.image.attach(
        io: URI.open(
          FOOD_IMAGES.sample
        ),
        filename: "food.jpg"
      )

    rescue => e

      puts "Food image failed"

    end

  end

  puts "Restaurant #{i+1}/100 created"

end


puts "📅 Creating bookings..."


Room.find_each do |room|

  rand(1..3).times do

    booking = Booking.create!(

      user:
        users.sample,

      room:
        room,

      guest_count:
        rand(1..8),

      reservation_duration:
        [60,90,120].sample,

      reservation_time:
        Faker::Time.forward(
          days: 30,
          period: :evening
        ),

      special_request:
        Faker::Restaurant.review,

      deposit_amount:
        (room.price * 0.20),

      status:
        BOOKING_STATUSES.sample

    )


    room
      .motel
      .food_items
      .sample(rand(1..5))
      .each do |food|

      FoodOrder.create!(

        booking:
          booking,

        food_item:
          food,

        quantity:
          rand(1..3),

        scheduled_ready_time:
          booking.reservation_time - 15.minutes,

        status:
          FOOD_STATUSES.sample

      )

    end

  end

end


puts ""
puts "🎉 Seed completed"
puts "Users: #{User.count}"
puts "Restaurants: #{Motel.count}"
puts "Rooms: #{Room.count}"
puts "Menu Items: #{FoodItem.count}"
puts "Bookings: #{Booking.count}"
puts "Food Orders: #{FoodOrder.count}"
