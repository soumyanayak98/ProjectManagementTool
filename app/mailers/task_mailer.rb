class TaskMailer < ApplicationMailer

  include ApplicationHelper
  def task_updated(task, email, sub)
    @task = task
    @assigned_users = @task.users.count > 0 ? assigned_users(@task.users) : "No one"
    mail(to: email, subject: sub)
  end
end
