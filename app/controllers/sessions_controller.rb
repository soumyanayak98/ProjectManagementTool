class SessionsController < ApplicationController

  before_action :logged_in_redirect, except: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:email] = user.email
      logger.info session.inspect
      flash[:notice] = "Logged in successfully!"
      redirect_to projects_path
    else
      flash.now[:alert] = "Invalid Credentials"
      render "new"    
    end
  end

  def destroy
    session[:email] = nil
    flash[:success] = "You have been successfully logged out!"
    redirect_to root_path
  end
end