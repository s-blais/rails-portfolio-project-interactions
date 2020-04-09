class ApplicationController < ActionController::Base

  include ApplicationHelper # or skip this and call these helper methods within the controllers using 'helpers.method_name' (Rails 5+, seems safer?)
  
  # helper_method :logged_in?
  # this would expose method to views if not defined in app/helpers
  
  # def logged_in?
  #   !!session[:user_id]
  # end
  
  # helper_method :require_login
  # this would expose method to views if not defined in app/helpers
  
  # def require_login
  #   redirect_to root_path unless logged_in?
  # end

  # helper_method :current_user
  # this would expose method to views if not defined in app/helpers

  # def current_user
  #   User.find(session[:used_id])
  # end

  # database-friendly current_user something more like 
  # @current_user ||= User.find(session[:user_id])
  # or @current_user ||= User.find_by_id@(session[:user_id])


end
