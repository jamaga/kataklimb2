class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?, :signed_out? # w widoku moge zrobic if signed_in?  do sth 

  def current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user ||= User.find(current_user_id)
    end
  end

  def signed_out?
    !signed_in?
  end

  def signed_in?
    session[:current_user_id]
  end

  def authenticate
    if signed_out?
      flash[:error] = "you must be logged-in in order to do this"
      redirect_to root_path
    end
  end
end
