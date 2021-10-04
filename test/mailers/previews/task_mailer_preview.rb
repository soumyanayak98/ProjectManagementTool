# Preview all emails at http://localhost:3000/rails/mailers/task_mailer
class TaskMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/task_mailer/task_updated
  def task_updated
    task = Task.find(6)
    sub = "task_mailer"
    TaskMailer.task_updated(task, task.feature.project.user.email, sub)
  end

end
