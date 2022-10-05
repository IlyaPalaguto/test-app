class SessionsController < ApplicationController
  
  skip_before_action :authenticate_user!

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:last_page], notice: 'Вы вошли в аккаунт!'
    else
      flash.now[:alert] = 'Неправильный email или пароль!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to session[:last_page]
  end

end
