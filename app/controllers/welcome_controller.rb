class WelcomeController < ApplicationController
  def home
    current_user if logged_in?
    # if session[:user_id]
    #   @user = User.find(session[:user_id])
    # end
  end
end
