class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  def home
    @events = Event.all
  end

  def dashboard
    @user = current_user
    # if current_user == photographer
      @bookings = Booking.all
      # add the current_user to find the unique bookings for a photographer's dashboard
    # else
      # @bookings = Booking.all.where(attendee: current_user.attendee)
      @events = Event.all
  end
end
