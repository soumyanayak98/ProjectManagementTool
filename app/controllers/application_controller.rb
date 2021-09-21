class ApplicationController < ActionController::Base

  helper_method :logged_in?, :curr_user

  def curr_user
    @curr_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!curr_user
  end

  def logged_in_redirect
    if logged_in?
      flash[:alert]= "You are already logged in!!"
      redirect_to root_path
    end
  end
end
