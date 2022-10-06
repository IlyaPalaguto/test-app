class SessionsController < ApplicationController
  
  skip_before_action :authenticate_user!

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to cookies.delete(:last_page) || root_path, success: 'Вы вошли в аккаунт!'
    else
      flash.now[:danger] = 'Неправильный email или пароль!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, success: 'Вы вышли из аккаунта'
  end

end
