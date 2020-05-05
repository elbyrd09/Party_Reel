class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  def home
    if params[:location]
      @events = Event.search_by_location_and_name_and_genre(params[:location])
    else
      @events = Event.all
    end
  end

  def dashboard
    @user = current_user
    # if current_user.is_photographer
      #@events = Event.all
      @bookings = Booking.all
      # add the current_user to find the unique bookings for a photographer's dashboard
    # else
      #@bookings = Booking.all.where(attendee: current_user.attendee)
      @available_photographer = Availablephotographer.new
      # @event = Event.find(params[:event_id])
    if current_user.photographer
      @eventsregistered = []
      current_user.photographer.availablephotographers.each do |availablity|
        @eventsregistered.push(availablity.event)
      end
    end
  end

  def edit_profile
    @attendee = current_user.attendee
    @photographer = current_user.photographer
  end
end

