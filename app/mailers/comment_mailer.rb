class CommentMailer < ApplicationMailer
  def new_comment(comment, email)
    @comment = comment
    @task =  comment.task

    mail to: email, subject: "A new comment added to the task"
  end
end
