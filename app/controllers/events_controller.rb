class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def index
    @events = Event.all
  end

  def show
    # nothing needed here for now....
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
