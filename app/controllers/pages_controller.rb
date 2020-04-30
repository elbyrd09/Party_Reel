class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:location]
      @events = Event.search_by_location_and_name_and_genre(params[:location])
    else
      @events = Event.all
      # gets user ip address
      user_ip_address = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
      # uses geocoder to convert ip address to coordinates
      user_location = Geocoder.search(user_ip_address)[0].data['loc']
      event_distance_hash = {}
      distances = []
      # hash of distance => event
      # array of distances
      @events.each do |event|
        distance = event.distance_from(user_location)
        event_distance_hash[distance] = event
        distances << distance
      end
      byebug
      # takes smallest distance from array
      smallest_distance = distances.min
      # retrieves the nearest event from hash
      @nearest_event = event_distance_hash[smallest_distance]
      raise
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

