class SessionsController < ApplicationController
  
  skip_before_action :authenticate_user!

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      if cookies[:last_page]
        redirect_to cookies[:last_page], notice: 'Вы вошли в аккаунт!'
        cookies.delete(:last_page)
      else
        redirect_to root_path
      end
    else
      flash.now[:alert] = 'Неправильный email или пароль!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: 'Вы вышли изи аккаунта'
  end

end
