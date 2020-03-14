class PaymentsController < ApplicationController
  def new
    @booking = current_user.attendee.bookings.where(state: 'pending').find(params[:booking_id])
  end

end
