class PackagesController < ApplicationController
  before_action :set_event, only: [:index, :show]
  before_action :set_package, only: [:show]
  before_action :set_photographers_present, only: [:index, :show]

  def index
    @packages = Package.all
    event_time_slots = (1..12).to_a
    @unavailable_times = []
    event_time_slots.each do |event_time_slot|
      time_slot_available = false
      @photographers_present.each do |photographer|
        if !photographer.unavailable_times.include?(event_time_slot)
          time_slot_available = true
        end
      end
      @unavailable_times << event_time_slot if !time_slot_available
    end
    # storing time slot chosen for photographer filter in show method
    session[:start_time] = params[:data_value]
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
  end

  private

  def set_photographers_present
    @photographers_present = []
    @event.availablephotographers.where.not(fully_booked: "Full" ).each do |availablephotographer|
      @photographers_present.push(availablephotographer.photographer)
    end
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_package
    @package = Package.find(params[:id])
  end
end
