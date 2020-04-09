class SessionsController < ApplicationController

  def new
    redirect_back(fallback_location: root_path) if logged_in?
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    # render 'welcome/home'
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end