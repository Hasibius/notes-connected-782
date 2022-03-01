class ApplicationController < ActionController::Base
  # Protect all routes by default
  # If you want to skip login for some pages add the following
  # line to your controller
  # skip_before_action :authenticate_user!, only: :METHOD_NAME
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name user_name photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name user_name bio photo])
  end
end
