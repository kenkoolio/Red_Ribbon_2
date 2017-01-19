class SessionsController < ApplicationController
  before_action :get_all_services, only: [:index]

  def index
  end

  def create #login
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id]) #user dashboard, users::show(:id)
    else
      flash[:errors] = ['Invalid email or password']
      redirect_to '/'
    end
  end

  def destroy #logout
    session[:user_id] = nil
    redirect_to '/'
  end

  private
  def user_params
    params.require(:sessions).permit(:email, :password)
  end

  def get_all_services
    @all_services = Service.all
  end
end
