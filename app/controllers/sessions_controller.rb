class SessionsController < ApplicationController

  def new
    redirect_back(fallback_location: root_path) if logged_in?
  end

  def create
    if auth
      @user = User.find_or_create_by(omniauth_uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.omniauth_provider = auth['provider']
        u.password = u.password_confirmation = SecureRandom.urlsafe_base64(n=6)
      end
    else
      @user = User.find_by(username: params[:user][:username])
      unless @user.authenticate(params[:user][:password])
        flash.alert = "Incorrect username and/or password"
        redirect_to login_path
        return
      end
    end
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end