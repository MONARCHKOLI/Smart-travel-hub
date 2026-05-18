class BookingMailer < ApplicationMailer
  default from: "noreply@smarttravelhub.com"

  def reservation_confirmation(booking)
    @booking = booking
    @user = booking.user
    @room = booking.room

    mail(
      to: @user.email,
      subject: "🍽 Reservation Confirmed ##{booking.id}"
    )
  end
end