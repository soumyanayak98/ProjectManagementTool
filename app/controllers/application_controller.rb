class ApplicationController < ActionController::Base

  helper_method :logged_in?, :curr_user

  def curr_user
    @curr_user ||= User.find_by(email: session[:email]) if session[:email]
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
