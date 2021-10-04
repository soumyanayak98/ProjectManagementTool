class TaskMailer < ApplicationMailer

  def task_updated(task, email, sub)
    @task = task
    mail(to: email, subject: sub)
  end
end
