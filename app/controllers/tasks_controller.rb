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
      sub = @task.saved_changes.empty? ? "A new user has been assigned to the task" : "Status of the task has Updated"
      send_emails(@task, sub)
      flash[:success] = "Task Updated Successfully!"
      redirect_to [@task.feature.project, @task.feature, @task]
    else
      flash[:notice] = "Error Occured!"
      redirect_to [@task.feature.project, @task.feature, @task]
    end
  end

  def done
    @task = Task.find(params[:id])
    @task.update_attribute(:done, true)
    flash[:success] = "Task Successfully finished!"
    sub = "Status of the task has been updated"
    send_emails(@task, sub)
    redirect_to @task.feature.project
  end

  def assign
    @task = Task.find(params[:id])
    if params[:user_id]
      user = User.find(params[:user_id])
      @task.users << user
      flash[:success] = "User successfully assigned to the task"
      sub = "User has been assigned to the task"
      send_emails(@task, sub)
      redirect_to @task.feature.project
    else
      flash[:notice] = "Please make a valid selection before assigning!"
      redirect_to @task.feature.project
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
  def send_emails(task, sub)
    emails = task.users.map(&:email)
    owner_email = task.feature.project.user.email
    task.users.each do |user|
      TaskMailer.task_updated(task, user.email, sub).deliver_now
    end
    TaskMailer.task_updated(task, owner_email, sub).deliver_now if !emails.include?(owner_email)
  end
end