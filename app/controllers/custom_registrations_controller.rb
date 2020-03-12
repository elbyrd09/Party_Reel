class CustomRegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    if params[:user][:is_photographer] == "true"
      new_photographer_path
    else
      new_attendee_path
    end
  end

  def update
    super

    if params[:attendee]
      attendee = resource.attendee
      attendee.update(attendee_params)
    else
      photographer = resource.photographer
      photographer.update(photographer_params)
    end
  end

  private

  def attendee_params
    params.require(:attendee).permit(:influencer, :interaction)
  end

  def photographer_params
    params.require(:photographer).permit(:camera, :lenses, :profession, :phone_number)
  end
end
