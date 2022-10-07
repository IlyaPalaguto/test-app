class UsersController < ApplicationController

  skip_before_action :authenticate_user!

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to tests_path, notice: 'Вы успешно зарегестрированы'
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
