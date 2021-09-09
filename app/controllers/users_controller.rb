class UsersController < ApplicationController

  before_action :logged_in_redirect

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:email] = @user.email
      logger.info session.inspect
      flash[:notice] = "Welcome #{@user.username}, You have Successfully signed Up!"
      redirect_to user_projects_path
    else
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username,:email, :password)
  end
end