class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  def home
    @events = Event.search_by_location_and_name_and_genre(params[:location])
  end

  def dashboard
    @user = current_user
    # if current_user == photographer
      @bookings = Booking.all
      # add the current_user to find the unique bookings for a photographer's dashboard
    # else
      #@bookings = Booking.all.where(attendee: current_user.attendee)
      #@events = Event.all
  end

  def edit_profile
    @attendee = current_user.attendee
    @photographer = current_user.photographer
  end
end
