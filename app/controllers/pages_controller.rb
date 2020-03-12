class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  def home
    @events = Event.all
  end

  def dashboard
    @user = current_user
    # if current_user == photographer
      @bookings = Booking.all.where(photographer: current_user.photographer)
    # else
      # @bookings = Booking.all.where(attendee: current_user.attendee)
  end
end
