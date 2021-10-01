class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @feature = Feature.find(params[:feature_id])
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build(comment_params)
    if @comment.save
      flash[:success]="Comment added successfully"
      owner_email = @comment.task.feature.project.user.email
      emails = @comment.task.users.map(&:email)
      if emails.size > 0
        @comment.task.users.each do |user|
          CommentMailer.new_comment(@comment, user.email).deliver_now
        end
      end
      CommentMailer.new_comment(@comment, owner_email).deliver_now if !emails.include?(owner_email)
      redirect_to [@project, @feature, @task]
    else
      redirect_to [@project, @feature, @task]
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :name)
  end
end