class TasksController < ApplicationController
  before_action :require_user
  def show
    @task = Task.find(params[:id])
  end
  def create
    @project = Project.find(params[:project_id])
    feature = Feature.find(params[:feature_id])
    @task = feature.tasks.build(task_params)
    if @task.save
      flash[:success] = "Task created successfully!"
      redirect_to @project
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:done, :started, :delivered, user_ids:[]))
      flash[:success] = "Task Updated Successfully!"
      redirect_to [@task.feature.project, @task.feature, @task]
    else
      flash[:notice] = "Error Occured!"
      redirect_to [@task.feature.project, @task.feature, @task]
    end
  end

  private
  def task_params
    params.require(:task).permit(:description)
  end
  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to continue"
      redirect_to login_path
    end
  end
end