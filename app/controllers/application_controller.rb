class ApplicationController < ActionController::Base
  # Protect all routes by default
  # If you want to skip login for some pages add the following
  # line to your controller
  # skip_before_action :authenticate_user!, only: :METHOD_NAME
  before_action :authenticate_user!
end
