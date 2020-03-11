class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def show
    # nothing needed here for now....
  end

  def create
    @event = Event.find(params[:event_id])
    @booking = Booking.new(booking_params)
    @booking.attendee = current_user.attendee
    @booking.event = @event
    if @booking.save
      redirect_to booking_path(@booking)
    else
      # redirect to package show page? Probably with some error message
      redirect to event_package_path(@event, params[:package])
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
    params.require(:booking).permit(:start_time, :end_time, :photographer, :package )
  end
end
