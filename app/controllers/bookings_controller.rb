class BookingsController < ApplicationController
  before_action :load_event
  before_action :authenticate_user!

  def create
    @booking = current_user.bookings.create(booking_params.merge({ event:  @event }))
    @booking.set_total_price
    @booking.save

    redirect_to @booking.event, notice: "Thank you for coming :D!"
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :total, :guest_count, :status)
  end

  def load_event
    @event = Event.find(params[:event_id])
  end
end
