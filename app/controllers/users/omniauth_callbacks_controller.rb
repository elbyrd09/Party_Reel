class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.find_for_facebook_oauth(request.env['omniauth.auth'])
    #function from user table ^ is run to verify if what Facebook gave us can be persisted to DB

    #If so, we redirect the user to our web app, and, if not, we start a new user registration
    #URL in Devise (users says no).  Doesn't break the login flow for the user
    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
