class ConvertBookingsToDineIn < ActiveRecord::Migration[8.1]
  def change

    rename_column :bookings,
                  :check_in,
                  :reservation_time

    remove_column :bookings,
                  :check_out,
                  :datetime

    add_column :bookings,
               :guest_count,
               :integer,
               default: 2

    add_column :bookings,
               :special_request,
               :text

    add_column :bookings,
               :reservation_duration,
               :integer,
               default: 90

  end
end