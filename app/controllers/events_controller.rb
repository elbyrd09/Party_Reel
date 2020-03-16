class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def index
    @events = Event.all
  end

  def show
    @photographers_present = []
    # Put each available Photographer inside the @photographers_present array,
    # so this will be an array of Photographer objects
    @event.availablephotographers.where.not(fully_booked: "Full" ).each do |availablephotographer|
      @photographers_present.push(availablephotographer.photographer)
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
