class WelcomeController < ApplicationController

  def home
    current_user if logged_in?
  end
  
end
