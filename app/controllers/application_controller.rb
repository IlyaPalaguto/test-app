class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  helper_method :current_user, :logged_in?

  add_flash_types :danger, :success
  
  private
  
  def authenticate_user!
    unless current_user
      redirect_to login_path, danger: 'Необходимо авторизоваться'
      cookies[:last_page] = request.original_url
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
  
end
