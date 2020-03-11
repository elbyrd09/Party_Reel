class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:edit, :update, :destroy]

  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.new(attendee_params)
    @attendee.user = current_user
    if @attendee.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
    @attendee = Attendee.find(current_user.attendee)
  end

  def update
    @attendee.update(attendee_params)
      if @attendee.save
      redirect_to dashboard_path
      else
      render 'edit'
    end
  end

  def destroy
    @attendee.destroy
    @attendee.save!
    redirect_to root_path
  end

private
  def set_attendee
    @attendee = Attendee.find(params[:id])
  end

  def attendee_params
    params.require(:attendee).permit(:interaction, :influencer)
  end
end
