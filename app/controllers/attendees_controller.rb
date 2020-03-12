class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:edit, :update, :destroy]

  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.new(attendee_params)
    @attendee.user = current_user
    if @attendee.save
      params[:attendee][:attendeeshotpreference_ids].reject(&:blank?).each do |preference|
        Attendeeshotpreference.create(attendee: @attendee, shotpreference_id: preference)
      end
      redirect_to dashboard_path(@attendee)
    else
      render 'new'
    end
  end

  def edit
    redirect_to edit_user_registration_path
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
    redirect_to root_path
  end

private
  def set_attendee
    @attendee = Attendee.find(current_user.attendee.id)
  end

  def attendee_params
    params.require(:attendee).permit(:interaction, :influencer)
  end
end
