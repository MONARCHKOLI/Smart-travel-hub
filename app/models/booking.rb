class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :food_orders, dependent: :destroy
  has_many :food_items, through: :food_orders

  # This allows the form to pass food_item_ids directly
  attr_accessor :food_item_ids

  after_create :create_food_orders

  private

  def create_food_orders
    return if food_item_ids.blank?

    food_item_ids.each do |item_id|
      # We calculate the scheduled time: Check-in - 15 minutes
      ready_time = self.check_in - 15.minutes
      
      FoodOrder.create!(
        booking: self,
        food_item_id: item_id,
        status: "scheduled",
        scheduled_ready_time: ready_time
      )
    end
  end
end
