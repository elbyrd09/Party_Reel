class AvailablephotographersController < ApplicationController
  # There are no params passed to the create method apart from the event_id (from the url),
  # user is current_user and fully_booked is 'Free' by default, wich is why there
  # is no availablephotographer_params method
  def create
    if Availablephotographer.where({event_id: params[:event_id], photographer_id: current_user.photographer})[0].nil? # condition to test if the photographer has already made themself available for this event
      @availablephotographer = Availablephotographer.new
      @availablephotographer.event = Event.find(params[:event_id])
      @availablephotographer.photographer = current_user.photographer
      @availablephotographer.fully_booked = "Free"
      redirect_to dashboard_path if @availablephotographer.save
    end
  end

  def destroy
    available_photographer = Availablephotographer.find(params[:id])
    available_photographer.destroy
    redirect_to dashboard_path
  end
end
