class UserTasksController < ApplicationController
  before_action :require_user

  def index
    @tasks = curr_user.tasks.paginate(page: params[:page], per_page: 4)
  end

  private
  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to continue"
      redirect_to login_path
    end
  end
end