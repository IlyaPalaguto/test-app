class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  
  protect_from_forgery prepend: true

  add_flash_types :danger, :success

  def default_url_options
    { lang: I18n.locale == I18n.default_locale ? nil : I18n.locale } 
  end

  protected

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

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
