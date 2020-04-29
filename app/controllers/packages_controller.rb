class PackagesController < ApplicationController
  before_action :set_event, only: [:index, :show]
  before_action :set_package, only: [:show]

  def index
    @packages = Package.all
  end

  def show
    @start_time = session[:start_time].to_i
    @end_time = @start_time + 1 # this will need to be adjust should we make bookings before 1 pm or after 12 am
    @available_photographers = []
    @photographers_present.each do |photographer|
      # filter available photographers based on time slot chosen
      if !photographer.unavailable_times.include?(@start_time)
        @available_photographers << photographer
        end
    end

    @booking = Booking.new
    @photographers_present = []
    # Put each available Photographer inside the @photographers_present array,
    # so this will be an array of Photographer objects
    @event.availablephotographers.where.not(fully_booked: "Full" ).each do |availablephotographer|
      @photographers_present.push(availablephotographer.photographer)
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_package
    @package = Package.find(params[:id])
  end
end
