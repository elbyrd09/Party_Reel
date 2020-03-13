class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def show
    # nothing needed here for now....
  end

  def create
    @package = Package.find(params[:booking][:package_id])
    @event = Event.find(params[:event_id])
    @booking = Booking.new(booking_params)
    if (@package.name == "SICKO Mode" || @package.name == "Timezones")
      # Booking starts at the day of the festival (at 00;00), ends the day after (at 00:00)
      @booking.start_time = Time.new(@event.start_date.year, @event.start_date.mon, @event.start_date.mday)
      @booking.end_time = Time.new(@event.end_date.year, @event.end_date.mon, @event.end_date.mday + 1)
    end
    @booking.attendee = current_user.attendee
    @booking.event = @event
    @booking.amount_cents = @package.price_cents
    @booking.state = 'pending'
    if @booking.save
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @booking.package.name,
          amount: @booking.amount_cents,
          currency: 'usd',
          quantity: 1
        }],
          success_url: dashboard_url,
          cancel_url: dashboard_url
      )

      @booking.update(checkout_session_id: session.id)
      redirect_to booking_path(@booking)
    else
      # redirect to package show page? Probably with some error message
      redirect_to event_package_path(@event, @package)
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    # photographer and package to be passed as hidden fields
    params.require(:booking).permit(:start_time, :end_time, :photographer_id, :package_id )
  end
end
