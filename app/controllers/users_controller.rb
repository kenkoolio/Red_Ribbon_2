class UsersController < ApplicationController
  before_action :get_user, only: [:show, :destroy]


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :controller => 'users', :action => 'show', :id => session[:user_id]
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/'
    end
  end

  def show
  end

  def destroy
    @user_in_session = User.find(session[:user_id])
    if @user_in_session == @user || @user_in_session.user_level == 9
      @user.destroy
      redirect_to '/'
    else
      flash[:errors] = ["You don't have permission to do that!"]
      redirect_to '/'
    end
  end

  private
  def user_params
    params.require(:users).permit(:email, :alias, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
