class Api::BookingsController < Api::BaseController
  before_action :set_event

  def create
    booking = @event.bookings.new(booking_params)
    booking.set_total_price

    if booking.save
      render status: 200, json: {
        message: "Booking successfully created",
        event: @event,
        booking: booking
      }.to_json
    else
      render status: 422, json: {
        message: "Booking could not be created",
        errors: booking.errors
      }.to_json
    end
  end

  private

def set_event
    @event = Event.find(params[:event_id])
  end

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :total, :guest_count, :status)
  end
end
