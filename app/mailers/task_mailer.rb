class TaskMailer < ApplicationMailer

  include ApplicationHelper
  def task_updated(task, email, sub)
    @task = task
    @assigned_users = assigned_users(@task.users)
    mail(to: email, subject: sub)
  end
end
