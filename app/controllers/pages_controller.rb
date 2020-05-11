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
      if !user_ip_address.nil?
        user_location = Geocoder.search(user_ip_address)[0].data['loc']
        distance_event_hash = {}
        @smallest_distance = 100000
        # hash of distance => event
        @events.each do |event|
          distance = event.distance_from(user_location)
          distance_event_hash[distance] = event
          @smallest_distance = distance if distance < @smallest_distance
        end
        # retrieves the nearest event from hash
        @nearest_event = distance_event_hash[@smallest_distance]
      else
        # in the (un)likely case we can't retrieve the users IP
        @nearest_event = @events[rand(1..@events.length)]
        @smallest_distance = nil
      end
    end
  end

  def dashboard
    @user = current_user
    # if current_user.is_photographer
    #@events = Event.all
    @bookings = Booking.where(photographer_id: current_user.photographer)
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

