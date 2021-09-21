class SessionsController < ApplicationController

  before_action :logged_in_redirect, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      logger.info session.inspect
      flash[:success] = "Logged in successfully!"
      redirect_to projects_path
    else
      flash.now[:alert] = "Invalid Credentials"
      render "new"    
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have been successfully logged out!"
    redirect_to root_path
  end

  def omniauth
    user= User.from_omniauth(auth)
    user.save
    session[:user_id] = user.id
    logger.info session.inspect
    flash[:success] = "Logged in successfully!"
    redirect_to projects_path
  end

  private
  def auth
    request.env["omniauth.auth"]
  end
end