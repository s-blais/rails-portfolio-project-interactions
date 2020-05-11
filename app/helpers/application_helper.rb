module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    redirect_to root_path unless logged_in?
  end
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def my_patient?(patient)
    current_user == patient.user
  end


end