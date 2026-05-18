class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_many :food_orders, dependent: :destroy
  has_many :food_items, through: :food_orders

  # after_create :create_food_orders
  after_create :send_confirmation_email

  before_create :set_default_status

  validate :reservation_time_in_future

  scope :search, ->(query){

    return all if query.blank?

    joins(:room)
    .where(
      "LOWER(rooms.room_type) LIKE :q
      OR CAST(bookings.id as text) LIKE :q",
      q:"%#{query.downcase}%"
    )

  }


  scope :by_status, ->(status){

    return all if status.blank?

    where(status:status)

  }


  scope :by_guest_count, ->(count){

    return all if count.blank?

    where(
      "guest_count >= ?",
      count
    )

  }

  private

  def reservation_time_in_future
    return if reservation_time.blank?

    if reservation_time <= Time.current
      errors.add(
        :reservation_time,
        "must be in the future"
      )
    end
  end

  # def create_food_orders
  #   return if food_items.blank?

  #   food_items.each do |food|

  #     ready_time =
  #       reservation_time - 15.minutes

  #     food_orders.create!(
  #       food_item: food,
  #       status: "scheduled",
  #       quantity: 1,
  #       scheduled_ready_time: ready_time
  #     )

  #   end
  # end

  def set_default_status
    self.status ||= "pending"
  end

  def send_confirmation_email
    BookingMailer
      .reservation_confirmation(self)
      .deliver_now
  end
end