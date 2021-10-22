class ProjectsController < ApplicationController

  before_action :require_user

  def index
    @projects = curr_user.projects.paginate(page: params[:page], per_page: 6)
  end
  
  def show
    @project = Project.find(params[:id])
    if @project.user != curr_user
      flash[:alert] = "You are not allowed to view this project"
      redirect_to projects_path
    end
    @features = @project.features
    if params[:search]
      @features = @project.features.search(params[:search])
      if @features.length == 0
        flash.now[:alert] = "no feature found"
      end
    else
      @features = @project.features.all
    end

  end

  def create
    @project = curr_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created successfully!"
      redirect_to projects_path
    else
      flash[:error] = @project.errors.full_messages.to_sentence
      redirect_to projects_path
    end
  end

  private
  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to create a project"
      redirect_to login_path
    end
  end
  def project_params
    params.require(:project).permit(:project_name)
  end
end