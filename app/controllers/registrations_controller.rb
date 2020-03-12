class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    if params[:user][:is_photographer] == "true"
      new_photographer_path
    else
      new_attendee_path
    end














































  end
end
