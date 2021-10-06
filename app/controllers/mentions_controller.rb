class MentionsController < ApplicationController
  def index
    @task = Task.find(params[:task_id])
    @users = @task.users
    respond_to do |format|
      format.json
    end
  end
end