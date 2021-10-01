class TaskMailer < ApplicationMailer

  def task_updated(task, email)
    @task = task
    mail(to: email, subject: "Task Updated")
  end
end
