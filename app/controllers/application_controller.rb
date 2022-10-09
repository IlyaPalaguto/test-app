class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :danger, :success

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name last_name])
  end

  def stored_location_for(resource)
    if resource.is_a?(Admin)
      session['admin_return_to'] = admin_root_path
    else
      super
    end
  end

end
