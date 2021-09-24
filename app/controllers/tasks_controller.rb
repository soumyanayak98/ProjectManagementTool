class TasksController < ApplicationController
  def show
    
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

  private
  def task_params
    params.require(:task).permit(:description)
  end
end