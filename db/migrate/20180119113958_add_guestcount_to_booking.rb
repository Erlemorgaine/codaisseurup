class AddGuestcountToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :guest_count, :integer
  end
end
