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
    else
      flash[:error] = "Task Description field is required"
      redirect_to @project
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:done, :started, :delivered, user_ids:[]))
      emails = @task.users.map(&:email)
      owner_email = @task.feature.project.user.email
      sub = @task.saved_changes.empty? ? "A new user has been assigned to the task" : "Status of the task has Updated"
      @task.users.each do |user|
        TaskMailer.task_updated(@task, user.email, sub).deliver_now
      end
      TaskMailer.task_updated(@task, owner_email, sub).deliver_now if !emails.include?(owner_email)
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