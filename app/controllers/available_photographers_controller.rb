class AvailablePhotographersController < ApplicationController
  # There are no params passed to the create method apart from the event_id (from the url),
  # user is current_user and fully_booked is 'Free' by default, wich is why there
  # is no availablephotographer_params method
  def create
    @availablephotographer = Availablephotographer.new
    @availablephotographer.event = Event.find(params[:event_id])
    @availablephotographer.user = current_user
    @availablephotographer.fully_booked = "Free"
    if @availablephotographer.save
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end
end
