class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(login_params[:email], login_params[:password])
    session[:user_id] = user.id
    redirect_to users_path
  end

  def destroy
    session.delete(:user_id)
    redirect_to users_path
  end

  private

  def login_params
    params.require(:login_info).permit(:email, :password)
  end
end
