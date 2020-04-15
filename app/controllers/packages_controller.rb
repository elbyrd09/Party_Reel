class PackagesController < ApplicationController
  before_action :set_event, only: [:index, :show]
  before_action :set_package, only: [:show]

  def index
    @packages = Package.all
    @photographers_present = []
    # Put each available Photographer inside the @photographers_present array,
    # so this will be an array of Photographer objects
    @event.availablephotographers.where.not(fully_booked: "Full" ).each do |availablephotographer|
      @photographers_present.push(availablephotographer.photographer)
    end
  end

  def show
    @booking = Booking.new
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_package
    @package = Package.find(params[:id])
  end
end
